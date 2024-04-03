/// @description playerCollision()
function playerCollision() {
	//Handles the player's collision code


	//var mySolid, mySpikeFloor, mySpikeWall, mySpikeCeiling;

	////Spikes
	//mySolid = instance_place(x, y+global.yspeed+1, objSolid);
	//mySolidLeft = instance_place(bbox_left + 4, y+global.yspeed+1, objSolid);
	//mySolidRight = instance_place(bbox_right - 4, y+global.yspeed+1, objSolid);
	//mySpikeFloor = instance_place(x, y+global.yspeed+1, objSpike);
	//mySpikeWall = instance_place(x+global.xspeed, y, objSpike);
	//mySpikeCeiling = instance_place(x, y+global.yspeed-1, objSpike);
	//if ((mySpikeFloor >= 0 and mySolid > -1 and mySolid.object_index == objSpike and (mySolidLeft < 0 or mySolidLeft.object_index == objSpike) and (mySolidRight < 0 or mySolidRight.object_index == objSpike)) || mySpikeWall >= 0 || mySpikeCeiling >= 0) && canHit {
	//    if objShockGuardEquip.count < 1 {
	//        global._health = 0;
	//        exit;
	//    }
	//    else {
	//        objShockGuardEquip.count--;
	//        playerGetHit(1);
	//    }
	//}
		
		
	//Floor
	var mySolid = instance_place(x, y+global.yspeed, objSolid);
	if mySolid >= 0 && global.yspeed > 0
	{
	    y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	    ground = true;
	    global.yspeed = 0;
    
	    if playLandSound {
			canPlayLandSound = true;
		}
    
	    //Note: there used to be a system here that set MM's sprite to the walking sprite when landing
	    //However, due to complications such as climbing up ladders, it was a lot of work for such a minor feature
	    //Therefore, it has been removed
	}


	//Wall
	mySolid = instance_place(x+global.xspeed, y, objSolid);
	if mySolid >= 0 && global.xspeed != 0 && (pltSpeedY == 0 or place_free(x, y+pltSpeedY)) 
	{
	    if global.xspeed < 0
	    {
	        x = mySolid.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index);
        
	        //For some reason, the code above would work correctly half the time, but clip MM inside the wall the other half
	        //This while-loop fixes the issue by forcing MM out of the wall
	        while place_meeting(x, y, mySolid)
	            x += 1;
	    }
	    else
	        x = mySolid.x - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
        
	    global.xspeed = 0;
	}


	//Ceiling
	mySolid = instance_place(x, y+global.yspeed, objSolid);
	if mySolid >= 0 && global.yspeed < 0
	{
		y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index);
    
	    //For some reason, the code above would work correctly half the time, but clip MM inside the ceiling the other half
	    //This while-loop fixes the issue by forcing MM out of the ceiling
	    while place_meeting(x, y, mySolid)
	        y += 1;
		
	    global.yspeed = 0;
	}


	//Topsolids
	var tpsld, totalTSs;
	tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+global.yspeed, objTopSolid, false, true)
	totalTSs = 0;
	while place_meeting(x, y+global.yspeed, objTopSolid)
	&& tpsld >= 0 && global.yspeed > 0
	{
	    if !place_meeting(x, y, tpsld)
	    {
	        y = tpsld.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	        ground = true;
	        global.yspeed = 0;
        
	        if playLandSound {
				canPlayLandSound = true;
			}
			break;
	    }
		
		platformID[totalTSs] = tpsld;
		instance_deactivate_object(tpsld);
		totalTSs += 1;
		tpsld = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+global.yspeed, objTopSolid, false, true);
	}
	var i;
	for(i = 0; i < totalTSs; i += 1)
		instance_activate_object(platformID[i]);	
	
	
}
