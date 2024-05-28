/// @description playerMovingPlatform()
function playerMovingPlatform() {
	//Handles moving platform collision


	//Jumpthrough moving platforms
	mySolid = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+global.yspeed+1, prtMovingPlatformJumpthrough, false, true)
	if mySolid >= 0
	{
	    if global.yspeed > 0 && (mySolid.id == movedPlatformID || movedPlatformID == -20)
	    {
	        if mySolid.dead == false
	        {
	            if !place_meeting(x, y, mySolid)
	            {
	                y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	                global.yspeed = 0;
                
	                ground = true;
	                if playLandSound == true
	                    canPlayLandSound = true;
	            }
	        }
	    }
	}


	//Floor (moving platforms)
	var maxID;
	maxID = -1;
	while place_meeting(x, y+global.yspeed, prtMovingPlatformSolid) /*&& global.yspeed >= 0*/ && !place_meeting(x, y, prtMovingPlatformSolid)
	&& collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+global.yspeed+1, prtMovingPlatformSolid, false, false)
	{
	    maxID += 1;
	    ID[maxID] = instance_place(x, y+global.yspeed, prtMovingPlatformSolid);
	    if ID[maxID].dead == false
	    {
	        y = ID[maxID].bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	        global.yspeed = 0;
        
	        ground = true;
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
	maxID = -1;
	var pltfm;
	pltfm = collision_rectangle(bbox_left+global.xspeed, bbox_top, bbox_right+global.xspeed, bbox_bottom-4, prtMovingPlatformSolid, false, false);
	while pltfm >= 0 && global.xspeed != 0 && (pltSpeedY == 0 or place_free(x, y+pltSpeedY)) 
	&& !collision_rectangle(bbox_left+4, bbox_bottom, bbox_right-4, bbox_bottom+3, pltfm, false, false)
	{
	    maxID += 1;
	    ID[maxID] = pltfm;
	    if ID[maxID].dead == false
	    {
	        if global.xspeed < 0 && ID[maxID].xspeed >= 0 && !(ID[maxID].yspeed > 0 and bbox_left+2 < ID[maxID].bbox_right)
	        {
	            x = ID[maxID].bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
	            while place_meeting(x, y, ID[maxID])
	                x += 1;
	        }
	        else if global.xspeed > 0 && ID[maxID].xspeed <= 0 && !(ID[maxID].yspeed > 0 and bbox_right-2 > ID[maxID].bbox_left)
	        {
	            x = ID[maxID].bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
	            while place_meeting(x, y, ID[maxID])
	                x -= 1;
	        }
            
	        global.xspeed = 0;
	    }
    
	    instance_deactivate_object(ID[maxID]);
	    pltfm = collision_rectangle(bbox_left+global.xspeed, bbox_top, bbox_right+global.xspeed, bbox_bottom-4, prtMovingPlatformSolid, false, false);
	}

	for(i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}


	//Ceiling (moving platforms)
	maxID = -1;
	while place_meeting(x, y+global.yspeed+sign(global.yspeed), prtMovingPlatformSolid) && global.yspeed < 0 && !place_meeting(x, y, prtMovingPlatformSolid)
	{
	    maxID += 1;
	    ID[maxID] = instance_place(x, y+global.yspeed+sign(global.yspeed), prtMovingPlatformSolid);
	    if ID[maxID].dead == false && global.yspeed <= ID[maxID].yspeed
	    {
	        y = ID[maxID].bbox_bottom + sprite_get_yoffset(mask_index);
	        if ID[maxID].yspeed == 0
	            global.yspeed = 0;
	        else
	            global.yspeed = ID[maxID].yspeed + 0.5;
	    }
    
	    instance_deactivate_object(ID[maxID]);
	}

	for(i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}


	//Spikes (now carried out at the end of this script to fully account for moving platforms)
	if !instance_exists(objSectionSwitcher)
	{	
	    //Lots of extra checks to make solid collision take priority over spike collision
	    //What this means is that when jumping on a solid and spike at the same time, you won't die, unlike in Mega Engine 1.5
	    //Updated: Now uses the direction MM is facing, MM's delta x-position and MM's current x-speed to calculate wall offset instead of which walking key is pressed for more consistency.
		var wallOffset = 0;
		if image_xscale > 0
			wallOffset = 1;
		else if image_xscale < 0
			wallOffset = -1;
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
		onWall = place_meeting(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + wallOffset, y, objSolid);
		onMovingWall = place_meeting(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + wallOffset, y, prtMovingPlatformSolid);
	    onCeiling = place_meeting(x, y+(global.yspeed+pltSpeedY)-1 - yDeduct, objSolid);
		onMovingCeiling = place_meeting(x, y+(global.yspeed+pltSpeedY)-1 - yDeduct, prtMovingPlatformSolid);
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
			mySpikeWall = instance_place(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + wallOffset, y, objSpike);
		else
			mySpikeWall = instance_place(x+(global.xspeed+pltSpeedX)+sign(global.xspeed+pltSpeedX) + (wallOffset+(slideSpeed*image_xscale)), y, objSpike);
		//
	
	    mySpikeCeiling = instance_place(x, y+(global.yspeed+pltSpeedY)-1 - yDeduct, objSpike);
    
	    if (((mySpikeFloor >= 0 || mySpikeFloorLeft >= 0 || mySpikeFloorRight >= 0) && onGround == false && onMovingGround == false && onTopSolid == false && onMovingTopSolid == false)
	     || (mySpikeWall >= 0 && onWall == false && onMovingWall == false) || (mySpikeCeiling >= 0 && onCeiling == false && onMovingCeiling == false)) && canHit == true
	    {
			canPlayLandSound = false;
	        if objShockGuardEquip.count < 1 {
		        global._health = 0;
		        exit;
		    }
		    else {
		        objShockGuardEquip.count--;
		        playerGetHit(1);
		    }
	    }
	}
	
	
	//Can we actually jump now? This prevents us from being able to jump before collision behaviours are able to occur.
	canJump = ground;
	

	//Play the landing SFX. Now carried out at the end since new spike floor code causes part of the landing SFX to start playing before the death SFX.
	if canPlayLandSound
	&& (!(x > sectionRight-6 && place_meeting(x-global.xspeed+6, y, objSectionArrowRight) //Right
		&& !collision_rectangle(sectionRight+1, bbox_top, sectionRight+2, bbox_bottom, objSolid, false, false))
		and !(x < sectionLeft+6 && place_meeting(x-global.xspeed-6, y, objSectionArrowLeft) //Left
		&& !collision_rectangle(sectionLeft-1, bbox_top, sectionLeft-2, bbox_bottom, objSolid, false, false)))
	&& (!objBossDoor.opening or !instance_exists(objBossDoor)) && (!objBossDoorH.opening or !instance_exists(objBossDoorH)) && !global.frozen && !audio_is_playing(sfxEnergyRestore) {
		
		if !isHit
			playSFX(sfxLand);
			
		canPlayLandSound = false;
	}
	
	
	//Reset moving platform speed floats.
	pltSpeedX = 0;
	pltSpeedY = 0;
	

}
