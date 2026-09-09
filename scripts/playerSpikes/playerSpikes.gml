/// @description playerMovingSpikes()
function playerSpikes() {
	//Spikes (now carried out after playerMovingPlatform() to fully account for all types of environmental collision)
	
	
	if !instance_exists(objSectionSwitcher)
	&& (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) 
	{	
	    //Lots of extra checks to make solid collision take priority over spike collision
	    //What this means is that when jumping on a solid and spike at the same time, you won't die, unlike in Mega Engine 1.5
	    //Updated: Now uses the direction MM is facing and MM's current x-speed to calculate wall offset instead of which walking key is pressed for more consistency.
		var wallOffset = 0;
		if image_xscale > 0
			wallOffset = 1;
		else if image_xscale < 0
			wallOffset = -1;
		if x_force > 0
			wallOffset = 3;
		else if x_force < 0
			wallOffset = -3;
		if (global.xspeed+pltSpeedX) > 0
			wallOffset = 1;
		else if (global.xspeed+pltSpeedX) < 0
			wallOffset = -1;
        
	    var yDeduct;
	    if isSlide == false {
			yDeduct = sprite_get_bbox_top(mask_index);
		}
	    else {
			yDeduct = 0;
		}
			
        
	    //See if there are any solids (since spikes are also solid, we need to deactivate them first)
	    instance_deactivate_object(objSpike);
	    var onGround, onMovingGround, onTopSolid, onMovingTopSolid, onWall, onMovingWall, onCeiling, onMovingCeiling;
	    onGround = place_meeting(x, y+(global.yspeed+pltSpeedY)+1, objSolid); //This is to make sure spikes directly next to floors are more fair (as in, you won't die immediately when touching them)
		onMovingGround = place_meeting(x, y+(global.yspeed+pltSpeedY)+1, prtMovingPlatformSolid); //Same is applied to moving platforms.
		onWall = place_meeting(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + (place_meeting(x+wallOffset, y, objSolid)*wallOffset), y, objSolid);
		onMovingWall = place_meeting(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + (place_meeting(x+wallOffset, y, prtMovingPlatformSolid)*wallOffset), y, prtMovingPlatformSolid);
	    onCeiling = place_meeting(x, y+(global.yspeed+pltSpeedY)-1 - (place_meeting(x, y-yDeduct, objSolid)*yDeduct), objSolid);
		onMovingCeiling = place_meeting(x, y+(global.yspeed+pltSpeedY)-1 - (place_meeting(x, y-yDeduct, prtMovingPlatformSolid)*yDeduct), prtMovingPlatformSolid);
	    instance_activate_object(objSpike);
		
		//See if there are any topsolids
		tpsld = collision_rectangle(bbox_left, bbox_bottom+(global.yspeed+pltSpeedY), bbox_right, bbox_bottom+(global.yspeed+pltSpeedY)+1, objTopSolid, false, true);
		totalTSs = 0;
		while tpsld >= 0
		{
			if bbox_bottom <= tpsld.bbox_top+1
			{
				onTopSolid = place_meeting(x, y+(global.yspeed+pltSpeedY)+1, tpsld); //Same as the onGround line above, but for top-solid floors
				break;
			}
			else
				onTopSolid = false;
        
			platformID[totalTSs] = tpsld;
			instance_deactivate_object(tpsld);
			totalTSs += 1;
			tpsld = collision_rectangle(bbox_left, bbox_bottom+(global.yspeed+pltSpeedY), bbox_right, bbox_bottom+(global.yspeed+pltSpeedY)+1, objTopSolid, false, true);
		}
		if tpsld < 0
			onTopSolid = false;
    
		for(i = 0; i < totalTSs; i += 1)
			instance_activate_object(platformID[i]);
		
		//See if there are any moving topsolids
		var pltfm, totalPlatforms, endCheck;
	    pltfm = collision_rectangle(bbox_left, bbox_bottom+(global.yspeed+pltSpeedY), bbox_right, bbox_bottom+(global.yspeed+pltSpeedY)+1, prtMovingPlatformJumpthrough, false, true);
	    totalPlatforms = 0;
		endCheck = false;
	    while pltfm >= 0 && !endCheck
	    {
	        if pltfm.id == movedPlatformID || movedPlatformID == -20
	        {
	            if pltfm.dead == false
	            {
	                if bbox_bottom <= pltfm.bbox_top+1
	                {
						onMovingTopSolid = place_meeting(x, y+(global.yspeed+pltSpeedY)+1, pltfm); //Same as the onGround line above, but for top-solid floors
						endCheck = true;
					}
	                else
	                    onMovingTopSolid = false;
	            }
	            else
	                onMovingTopSolid = false;
                
	            break;
	        }
        
	        platformID[totalPlatforms] = pltfm;
	        instance_deactivate_object(pltfm);
	        totalPlatforms += 1;
	        pltfm = collision_rectangle(bbox_left, bbox_bottom+(global.yspeed+pltSpeedY), bbox_right, bbox_bottom+(global.yspeed+pltSpeedY)+1, prtMovingPlatformJumpthrough, false, true);
	    }
		if pltfm < 0 && !endCheck
			onMovingTopSolid = false;
		
	    for(i = 0; i < totalPlatforms; i += 1)
	        instance_activate_object(platformID[i]);
		
		//if global.yspeed != jumpSpeed
	    //    mySpikeFloor = instance_position(x, bbox_bottom+global.yspeed+1, objSpike);
	    //else
	    //    mySpikeFloor = instance_position(x, bbox_bottom+abs(global.yspeed)+1, objSpike);
	    //mySpikeFloorLeft = instance_position(bbox_left, bbox_bottom+global.yspeed+1, objSpike);
	    //mySpikeFloorRight = instance_position(bbox_right, bbox_bottom+global.yspeed+1, objSpike);
		
		//New spike floor code; old code above causes you to die from randomly jumping onto a spike even if you're close enough to a normal ground tile. 
		//Use this code if you want more consistent spike behaviour.
		//WARNING: Whether or not this is accurate to the official games, however, I am not certain, as there seems to be no way of proving it.
		mySpikeFloor = instance_position(x, bbox_bottom+sign(global.yspeed+pltSpeedY), objSpike);
	    mySpikeFloorLeft = instance_position(bbox_left, bbox_bottom+sign(global.yspeed+pltSpeedY), objSpike);
	    mySpikeFloorRight = instance_position(bbox_right, bbox_bottom+sign(global.yspeed+pltSpeedY), objSpike);
		//
		
		//Updated the spike wall code to allow MM to die from sliding into spike walls consistently.
		if !isSlide
			mySpikeWall = instance_place(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + (place_meeting(x+wallOffset, y, objSpike)*wallOffset), y, objSpike);
		else
			mySpikeWall = instance_place(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + ((place_meeting(x+wallOffset, y, objSpike)*wallOffset)+(slideSpeed*image_xscale)), y, objSpike);
		//
	
	    mySpikeCeiling = instance_place(x, y+(global.yspeed+pltSpeedY)-1 - (place_meeting(x, y-yDeduct, objSpike)*yDeduct), objSpike);
    
	    if (((mySpikeFloor >= 0 || mySpikeFloorLeft >= 0 || mySpikeFloorRight >= 0) && onGround == false && onMovingGround == false && onTopSolid == false && onMovingTopSolid == false)
	     || (mySpikeWall >= 0 && onWall == false && onMovingWall == false) || (mySpikeCeiling >= 0 && onCeiling == false && onMovingCeiling == false)) && canHit == true
	    {
			//canPlayLandSound = false; //Comment out if you don't want spike death to cancel landing SFX
	        if objShockGuardEquip.count < 1 {
		        global._health = 0;
				if killTime <= 0 stopSFX(sfxLand);
		        exit;
		    }
		    else {
		        objShockGuardEquip.count--;
		        playerGetHit(0, true);
		    }
	    }
	}


}