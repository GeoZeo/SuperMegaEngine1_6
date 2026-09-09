/// @description playerCheckGround()
function playerCheckGround() {
	//Check for ground
	
	var _total_yspeed = global.yspeed + global.yforce;
	
	var _yc = clamp(abs(_total_yspeed), 0.5, 1);
	
	if place_meeting(x, y+_total_yspeed+_yc, objSolid) || (place_meeting(x, y+_total_yspeed+_yc, objTopSolid)  && _total_yspeed >= 0)
	|| (place_meeting(x, y+_total_yspeed+_yc, prtMovingPlatformJumpthrough) && _total_yspeed >= 0)
	|| (place_meeting(x, y+_total_yspeed+_yc, prtMovingPlatformSolid) && !place_meeting(x, y, prtMovingPlatformSolid))
	{
		var endCheck = false;
		
	    if place_meeting(x, y+_total_yspeed+_yc, objSolid)
	    {	
	        ground = true;
			endCheck = true;
	    }
		
		var tpsld, totalTSs;
		tpsld = collision_rectangle(bbox_left, bbox_bottom+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+_yc, objTopSolid, false, true);
		totalTSs = 0;
		while tpsld >= 0 && endCheck == false
		{
			if bbox_bottom <= tpsld.bbox_top
			{
				ground = true;
				endCheck = true;
				break;
			}
			else if !onRushJet
				ground = false;
        
			platformID[totalTSs] = tpsld;
			instance_deactivate_object(tpsld);
			totalTSs += 1;
			tpsld = collision_rectangle(bbox_left, bbox_bottom+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+_yc, objTopSolid, false, true);
		}
		if place_meeting(x, y+_total_yspeed+_yc, objTopSolid) && endCheck == false
			if tpsld < 0 && !onRushJet
				ground = false;
    
		var i;
		for(i = 0; i < totalTSs; i += 1)
			instance_activate_object(platformID[i]);

		var pltfm, totalPlatforms;
	    pltfm = collision_rectangle(bbox_left, bbox_bottom+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+_yc, prtMovingPlatformJumpthrough, false, true);
	    totalPlatforms = 0;
	    while pltfm >= 0 && endCheck == false
	    {
			if ground && (movedPlatformID != 20 and pltfm.id != movedPlatformID) && (instance_exists(movedPlatformID) and place_free(x, y - (abs(movedPlatformID.yspeed) + abs(_total_yspeed))))
				break;
			
	        if pltfm.id == movedPlatformID || movedPlatformID == -20
	        {
	            if pltfm.dead == false
	            {
	                if bbox_bottom <= pltfm.bbox_top
	                {
						if !prevGround && _total_yspeed <= 0
						{
							if !rollbackMovement global.yspeed = 0;
							
							if playLandSound && !audio_is_playing(sfxLand)
								canPlayLandSound = true;
						}
						
	                    ground = true;
	                    endCheck = true;
	                }
	                else
	                    ground = false;
	            }
	            else if !onRushJet
	                ground = false;
                
	            if !rollbackMovement or endCheck break;
	        }
        
	        platformID[totalPlatforms] = pltfm;
	        instance_deactivate_object(pltfm);
	        totalPlatforms += 1;
	        pltfm = collision_rectangle(bbox_left, bbox_bottom+_total_yspeed, bbox_right, bbox_bottom+_total_yspeed+_yc, prtMovingPlatformJumpthrough, false, true);
	    }
		if place_meeting(x, y+_total_yspeed+_yc, prtMovingPlatformJumpthrough) && endCheck == false
			if pltfm < 0 && !onRushJet
				ground = false;
		
	    for(i = 0; i < totalPlatforms; i += 1)
	        instance_activate_object(platformID[i]);
    
	    //The extra code is to check for multiple moving platforms at once
	    //Otherwise the game could detect a dead platform while we're also above a living platform, causing us to fall through it
	    var maxID;
	    maxID = -1;
	    while place_meeting(x, y+_total_yspeed+_yc, prtMovingPlatformSolid) && !endCheck
	    {
	        maxID += 1;
	        ID[maxID] = instance_place(x, y+_total_yspeed+_yc, prtMovingPlatformSolid);
        
	        if ID[maxID].dead == false
	        {		
				if !prevGround && _total_yspeed <= 0
				{
					if !rollbackMovement
					{
						global.yspeed = 0;
					}
							
					if playLandSound && !audio_is_playing(sfxLand) && ID[maxID].bbox_top >= mask_get_ycenter()
						canPlayLandSound = true;
				}
				
	            ground = true;
	        }
	        else
	            ground = false;
            
	        instance_deactivate_object(ID[maxID]);
	    }
    
	    for(i = 0; i <= maxID; i += 1) //Re-activate the platforms
	    {
	        instance_activate_object(ID[i]);
	    }
		
		_total_yspeed = global.yspeed + global.yforce;
    
	    if !place_meeting(x, y+_total_yspeed+_yc, objSolid) && !place_meeting(x, y+_total_yspeed+_yc, objTopSolid)
	    && !place_meeting(x, y+_total_yspeed+_yc, prtMovingPlatformJumpthrough) && !place_meeting(x, y+_total_yspeed+_yc, prtMovingPlatformSolid)
	    {
	        ground = true;
	    }
	}
	else
	{
	    ground = false;
		canJump = false;
		if jumps < 1 jumps = 1;
	    if prevGround == true && !flying
	        y += 1; //To make Mega Man able to fall through 1-block wide gaps
	}
	
	
	
}
