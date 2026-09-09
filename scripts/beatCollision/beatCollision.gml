/// @description beatCollision()
function beatCollision() {
	//Handles the player's collision code during Beat mode
	
	
	//Merge speed with force applied
	var _total_xspeed = global.xspeed + global.xforce;
	var _total_yspeed = global.yspeed + global.yforce;
	
	
	//Adjust the offset for surface checks in case the player's speed (positive or negative) is less than the minimum collision check threshold (which is 0.5 (0.500005 for going left))
	var _xAdd = 0;
	if _total_xspeed > 0 && _total_xspeed < 0.5
	{
		_xAdd = 0.5 - _total_xspeed;
	}
	else if _total_xspeed < 0 && _total_xspeed > -0.500005
	{
		_xAdd = -0.500005 - _total_xspeed;
	}
	
	var _yAdd = 0;
	if abs(_total_yspeed) > 0 && abs(_total_yspeed) < 0.5
	{
		_yAdd = 0.5 - abs(_total_yspeed);
	}


	floors = [];
	leftWalls = [];
	rightWalls = [];
	ceilings = [];
	
	//Floor
	var mySolid = instance_place(x, (y + _total_yspeed) + (_yAdd * place_meeting(x, y+1, objSolid)), objSolid);
	if mySolid >= 0 && _total_yspeed > 0 && collision_rectangle_free(bbox_left, bbox_top-1, bbox_right, bbox_top, false, false, true)
	{
	    //if !crushed
		//{ 
		//	var _floor = (mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1);
		//	floors[array_length_1d(floors)] = _floor;
		//}
		if !crushed 
		{
			//y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
			var _floor = (mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1);
			floors[array_length_1d(floors)] = _floor;
			againstGround = true;
		}
		
		if (!place_meeting(x, (y + _total_yspeed) + (_yAdd * place_meeting(x, y+1, objBossDoorH)), objBossDoorH)
		or instance_place(x, (y + _total_yspeed) + (_yAdd * place_meeting(x, y+1, objBossDoorH)), objBossDoorH).dir == 1)// and !disableSpeedResetting
		{
			yspeedRollback = global.yspeed;
			//global.yspeed = 0;
		}
		
	    ground = true;
	
	    if playLandSound {
			canPlayLandSound = true;
		}
		
		//print("Ground");
    
	    //Note: there used to be a system here that set MM's sprite to the walking sprite when landing
	    //However, due to complications such as climbing up ladders, it was a lot of work for such a minor feature
	    //Therefore, it has been removed
	}


	//Wall
	mySolid = instance_place((x + _total_xspeed) + (_xAdd * place_meeting(x+sign(_total_xspeed), y, objSolid)), y, objSolid);
	if mySolid >= 0 && _total_xspeed != 0// && (pltSpeedY == 0 or place_free(x, y+pltSpeedY)) 
	{
	    if !crushed
		{
			if _total_xspeed < 0
		    {
				var __old_x = x;
				
		        x = mySolid.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index);
        
		        //For some reason, the code above would work correctly half the time, but clip MM inside the wall the other half
		        //This while-loop fixes the issue by forcing MM out of the wall
		        while place_meeting(x, y, mySolid)
		            x += 1;
					
				leftWalls[array_length_1d(leftWalls)] = x;
				x = __old_x;
					
				againstWallLeft = true;
		    }
		    else if _total_xspeed >= 0
			{
				var __old_x = x;
				
		        x = mySolid.x - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
				
				if image_xscale < 0
					x += 1;
					
				rightWalls[array_length_1d(rightWalls)] = x;
				x = __old_x;
					
				againstWallRight = true;
			}
		}
		
		xspeedRollback = global.xspeed;
		//global.xspeed = 0;
	}


	//Ceiling
	mySolid = instance_place(x, (y + _total_yspeed) - (_yAdd * place_meeting(x, y-1, objSolid)), objSolid);
	if mySolid >= 0 && _total_yspeed < 0 && collision_rectangle_free(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, false, false, true)
	{
		if !crushed
		{
			var __old_y = y;
			
			y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index) - sprite_get_bbox_top(mask_index);
    
		    //For some reason, the code above would work correctly half the time, but clip MM inside the ceiling the other half
		    //This while-loop fixes the issue by forcing MM out of the ceiling
		    while place_meeting(x, y, mySolid)
		        y += 1;
				
			ceilings[array_length_1d(ceilings)] = y;
			y = __old_y;
				
			againstCeiling = true;
		}
			
		yspeedRollback = global.yspeed;
		//global.yspeed = 0;
		//print("Ceiling");
	}
	
	
	//Define a new offset for topsolid collisions
	var __yAdd = 0;
	if abs(_total_yspeed) >= 0.5 && abs(_total_yspeed) < 1
	{
		__yAdd = 1 - abs(_total_yspeed);
	}


	//Topsolids
	//print(y);
	var near, tpsld, totalTSs;
	near = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, objTopSolid, false, true)
	tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, (bbox_bottom + (_total_yspeed + (__yAdd * (near >= 0)))) + (_yAdd * (near >= 0)), objTopSolid, false, true)
	totalTSs = 0;
	while place_meeting(x, (y + _total_yspeed) + (_yAdd * (near >= 0)), objTopSolid)
	&& tpsld >= 0 && _total_yspeed > 0
	{
	    //var _offset = ((sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1);
		if !place_meeting(x, y, tpsld) //&& ((old_y + _offset) - ((isSlide || isStun) * 4)) <= tpsld.y
	    {
			//if !crushed
			//{
			//	var _floor = (tpsld.y - _offset) + ((isSlide || isStun) * 4);
			//	floors[array_length_1d(floors)] = _floor;
			//}
			if !crushed
			{
				//y = tpsld.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
				var _floor = tpsld.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
				floors[array_length_1d(floors)] = _floor;
				againstGround = true;
			}
			
	        ground = true;
			yspeedRollback = global.yspeed;
			//global.yspeed = 0;
        
	        if playLandSound {
				canPlayLandSound = true;
			}
			break;
	    }
		
		platformID[totalTSs] = tpsld;
		instance_deactivate_object(tpsld);
		totalTSs += 1;
		near = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, objTopSolid, false, true);
		tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, (bbox_bottom + (_total_yspeed + (__yAdd * (near >= 0)))) + (_yAdd * (near >= 0)), objTopSolid, false, true);
	}
	var i;
	for(i = 0; i < totalTSs; i += 1)
		instance_activate_object(platformID[i]);	
		
	
	////DON'T play the landing SFX.
	//canPlayLandSound = false;
	
	//if isHit
	//	stopSFX(sfxLand);
	
	
}
