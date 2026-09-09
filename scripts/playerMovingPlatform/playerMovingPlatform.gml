/// @description playerMovingPlatform()
function playerMovingPlatform() {
	//Handles moving platform collision
	
	
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
	
	
	//Define a new offset for topsolid collisions
	var __yAdd = 0;
	if abs(_total_yspeed) >= 0.5 && abs(_total_yspeed) < 1
	{
		__yAdd = 1 - abs(_total_yspeed);
	}


	//Jumpthrough moving platforms
	var near = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, prtMovingPlatformJumpthrough, false, true);
	mySolid = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, (bbox_bottom + (_total_yspeed + (__yAdd * (near >= 0)))) + (_yAdd * (near >= 0)) + 1, prtMovingPlatformJumpthrough, false, true)
	if mySolid >= 0
	{
	    if _total_yspeed > 0 && (mySolid.id == movedPlatformID || movedPlatformID == -20)
	    {
	        if mySolid.dead == false
	        {
	            if !place_meeting(x, y, mySolid)// || (!disableSpeedResetting and !place_meeting(x, y-global.yspeed, mySolid))
	            {
					print("Hi?");
					
	                if !crushed
					{
						y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
						//againstGround = true;
					}
					
					global.yspeed = 0;
					_total_yspeed = global.yspeed + global.yforce;
					//if !disableSpeedResetting
					//{
					//	global.yspeed = 0;
					//}
					
					ground = true;
					isDash = false;
			        if playLandSound == true
			            canPlayLandSound = true;
	            }
	        }
	    }
	}


	//Floor (moving platforms)
	var maxID;
	maxID = -1;
	near = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, prtMovingPlatformSolid, false, true);
	while place_meeting(x, (y + _total_yspeed) + (_yAdd * place_meeting(x, y+1, prtMovingPlatformSolid)), prtMovingPlatformSolid) /*&& global.yspeed >= 0*/ && !place_meeting(x, y, prtMovingPlatformSolid)
	&& collision_rectangle(bbox_left, bbox_bottom, bbox_right, (bbox_bottom + _total_yspeed) + (_yAdd * (near >= 0)) + 1, prtMovingPlatformSolid, false, false)
	{
	    maxID += 1;
		near = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, prtMovingPlatformSolid, false, true);
	    ID[maxID] = instance_place(x, (y + _total_yspeed) + (_yAdd * place_meeting(x, y+1, prtMovingPlatformSolid)), prtMovingPlatformSolid);
	    if ID[maxID].dead == false
	    {
	        if !crushed
			{
				y = ID[maxID].bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
				//againstGround = true;
			}
	        global.yspeed = 0;
			_total_yspeed = global.yspeed + global.yforce;
			//if !disableSpeedResetting
			//	global.yspeed = 0;
        
			ground = true;
			isDash = false;
		    if playLandSound == true
		        canPlayLandSound = true;
        
	        //Note: there used to be a system here that set MM's sprite to the walking sprite when landing
	        //However, due to complications such as climbing up ladders, it was a lot of work for such a minor feature
	        //Therefore, it has been removed
	    }
    
	    instance_deactivate_object(ID[maxID]);
	}

	for(i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}


	//Wall (moving platforms)
	near = collision_rectangle(bbox_left+sign(_total_xspeed), bbox_top, bbox_right+sign(_total_xspeed), bbox_bottom-4, prtMovingPlatformSolid, false, true);
	maxID = -1;
	var pltfm;
	pltfm = collision_rectangle((bbox_left + _total_xspeed) + (_xAdd * (near >= 0)), bbox_top, (bbox_right + _total_xspeed) + (_xAdd * (near >= 0)), bbox_bottom-4, prtMovingPlatformSolid, false, false);
	while pltfm >= 0 && _total_xspeed != 0// && (pltSpeedY == 0 or place_free(x, y+pltSpeedY)) 
	&& !collision_rectangle(bbox_left+4, bbox_bottom, bbox_right-4, bbox_bottom+3, pltfm, false, false)
	{
	    maxID += 1;
	    ID[maxID] = pltfm;
	    if ID[maxID].dead == false
	    {
	        if !crushed
			{
				if _total_xspeed < 0 && ID[maxID].xspeed >= 0 && !(ID[maxID].yspeed > 0 and bbox_left+2 < ID[maxID].bbox_right)
		        {
		            x = ID[maxID].bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
		            while place_meeting(x, y, ID[maxID])
		                x += 1;
						
					if image_xscale > 0
						x -= 1;
						
					//againstWallLeft = true;
		        }
		        else if _total_xspeed > 0 && ID[maxID].xspeed <= 0 && !(ID[maxID].yspeed > 0 and bbox_right-2 > ID[maxID].bbox_left)
		        {
		            x = ID[maxID].bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
		            while place_meeting(x, y, ID[maxID])
		                x -= 1;
						
					if image_xscale < 0
						x += 1;
						
					//againstWallRight = true;
		        }
			}
            
	        global.xspeed = 0;
			_total_xspeed = global.xspeed + global.xforce;
			//if !disableSpeedResetting
			//	global.xspeed = 0;
	    }
    
	    instance_deactivate_object(ID[maxID]);
		near = collision_rectangle(bbox_left+sign(_total_xspeed), bbox_top, bbox_right+sign(_total_xspeed), bbox_bottom-4, prtMovingPlatformSolid, false, true);
	    pltfm = collision_rectangle((bbox_left + _total_xspeed) + (_xAdd * (near >= 0)), bbox_top, (bbox_right + _total_xspeed) + (_xAdd * (near >= 0)), bbox_bottom-4, prtMovingPlatformSolid, false, false);
	}

	for(i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}


	//Ceiling (moving platforms)
	maxID = -1;
	while place_meeting(x, y+_total_yspeed+sign(_total_yspeed), prtMovingPlatformSolid) && _total_yspeed < 0 && !place_meeting(x, y, prtMovingPlatformSolid)
	{
	    maxID += 1;
	    ID[maxID] = instance_place(x, y+_total_yspeed+sign(_total_yspeed), prtMovingPlatformSolid);
	    if ID[maxID].dead == false && _total_yspeed <= ID[maxID].yspeed
	    {
	        if !crushed
			{
				y = ID[maxID].bbox_bottom + sprite_get_yoffset(mask_index) - sprite_get_bbox_top(mask_index);
				//againstCeiling = true;
			}
	        if ID[maxID].yspeed == 0
			{
				if global.yforce >= 0 { global.yspeed = 0; }
				else { global.yspeed = -global.yforce; }
	            //if !disableSpeedResetting
				//{
				//	global.yspeed = 0;
				//}
			}
	        else
			{
				if global.yforce >= 0 { global.yspeed = ID[maxID].yspeed + 0.5; }
				else { global.yspeed = -global.yforce + ID[maxID].yspeed + 0.5 }
			}
			
			_total_yspeed = global.yspeed + global.yforce;
	    }
    
	    instance_deactivate_object(ID[maxID]);
	}

	for(i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}
	
	
	//Play the landing SFX.
	if canPlayLandSound
	{
		
		if !isStun
			playSFX(sfxLand);
			
		canPlayLandSound = false;
	}
	else if !ground
	{
		
		canPlayLandSound = false;
	}
	
	if isHit
		stopSFX(sfxLand);


}
