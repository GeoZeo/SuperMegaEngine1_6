event_inherited();

//If transitioning on top of a moving platform, move the platform at the same speed as Mega Man
//Different conditions for browser or desktop, at least until this issue is better understood
if keepOnSwitch && global.frozen && !dead && instance_exists(objSectionSwitcher) && instance_exists(prtPlayer) && ( (os_browser == browser_not_a_browser && place_meeting(x, y-1, prtPlayer) ) || (os_browser != browser_not_a_browser && place_meeting(x, bbox_top-1, prtPlayer) )) && objSectionSwitcher.plt == self {
    x += objSectionSwitcher.playerSpeedHor * sign(xspeed);

    //Small hop workaround
    if os_browser == browser_not_a_browser
        y += objSectionSwitcher.playerSpeedVert * sign(yspeed);
    else
        y = prtPlayer.bbox_bottom + sprite_yoffset + 1 + objSectionSwitcher.playerSpeedVert;
}

if global.frozen == false && dead == false
{
	x += xspeed * update_rate;
    y += yspeed * update_rate;
    
    // Push the player in the direction we're moving
    if place_meeting(x, y, prtPlayer)
    {
        if prtPlayer.teleporting == false && prtPlayer.showReady == false
        {
            var leftDist, rightDist, upDist, downDist, attempts;
            leftDist = 0;
            rightDist = 0;
            upDist = 0;
            downDist = 0;
            
            attempts = 0;
            while place_meeting(x + leftDist, y, prtPlayer) && attempts < 500
            {
                leftDist += 1;
                attempts += 1;
            }
            
            attempts = 0;
            while place_meeting(x - rightDist, y, prtPlayer) && attempts < 500
            {
                rightDist += 1;
                attempts += 1;
            }
            
            attempts = 0;
            while place_meeting(x, y + upDist, prtPlayer) && attempts < 500
            {
                upDist += 1;
                attempts += 1;
            }
            
            attempts = 0;
            while place_meeting(x, y - downDist, prtPlayer) && attempts < 500
            {
                downDist += 1;
                attempts += 1;
            }
                
            var minDist;
            minDist = min(leftDist, rightDist, upDist, downDist);
            if minDist == upDist || (yspeed < 0 && abs(minDist - upDist) <= 3)
			{
				prtPlayer.pltSpeedY = yspeed;
                prtPlayer.y -= upDist;
			}
            else if minDist == leftDist || (xspeed < 0 && abs(minDist - leftDist) <= 3)
			{
				prtPlayer.pltSpeedX = xspeed;
                prtPlayer.x -= leftDist;
			}
			else if minDist == rightDist || (xspeed > 0 && abs(minDist - rightDist) <= 3)
			{
				prtPlayer.pltSpeedX = xspeed;
                prtPlayer.x += rightDist;
			}
			else if minDist == downDist || (yspeed > 0 && abs(minDist - downDist) <= 3)
			{
				prtPlayer.pltSpeedY = yspeed;
                prtPlayer.y += downDist;
			}
                
            // Crush the player if necessary
            with prtPlayer
            {
                instance_deactivate_object(other.id);
                var movingPltfm, meetingPlatform;
                movingPltfm = collision_rectangle(bbox_left+2, bbox_top+2 - (isSlide * 2), bbox_right-2, bbox_bottom-2 + (isSlide * 2), prtMovingPlatformSolid, false, false);
                
                meetingPlatform = false;
                if movingPltfm >= 0
                {
                    if movingPltfm.dead == false
                        meetingPlatform = true;
                }
                
                if collision_rectangle(bbox_left+2, bbox_top+2 - (isSlide * 2), bbox_right-2, bbox_bottom + (isSlide * 2), objSolid, false, false)
                || meetingPlatform == true
                    global._health = 0;
                instance_activate_object(other.id);
            }
        }
    }
    
    // If the player is standing on us, move them
    var checkYspeed;
    if yspeed > 0
        checkYspeed = yspeed;
    else
        checkYspeed = 0;
        
    if place_meeting(x, y - checkYspeed - 1, prtPlayer)
    {
        if prtPlayer.ground == true && prtPlayer.bbox_bottom <= bbox_top + abs(yspeed) + abs(global.yspeed) + 2
        && prtPlayer.movedByPlatform == false && prtPlayer.teleporting == false
        && prtPlayer.showReady == false
        {
            with prtPlayer
            {
                var proceed, xsp, ysp;
                proceed = true;
                xsp = other.xspeed * update_rate;
                ysp = other.yspeed * update_rate;
				pltSpeedX = xsp;
				pltSpeedY = ysp;
                
                instance_deactivate_object(other.id);
                if place_meeting(x + xsp, y + ysp, objSolid) 
				|| place_meeting(x + xsp, y + ysp, prtMovingPlatformSolid)
				|| (place_meeting(x + xsp, y + ysp, objTopSolid) && ysp > 0)
				|| (place_meeting(x + xsp, y + ysp, prtMovingPlatformJumpthrough) && ysp > 0)
				{
					if place_meeting(x + xsp, y + ysp, objTopSolid) && ysp > 0
					{
						var tpsld, totalTSs, endCheck;
						tpsld = collision_rectangle(bbox_left+xsp, bbox_bottom, bbox_right+xsp, bbox_bottom+ysp, objTopSolid, false, true);
						totalTSs = 0;
						endCheck = false;
						while tpsld >= 0 && endCheck == false
						{
							if bbox_bottom <= tpsld.bbox_top+1
							{
								proceed = false;
								if ysp > 0 && !place_meeting(x, y, tpsld)
									y = tpsld.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
								endCheck = true;
								break;
							}
        
							platformID[totalTSs] = tpsld;
							instance_deactivate_object(tpsld);
							totalTSs += 1;
							tpsld = collision_rectangle(bbox_left+xsp, bbox_bottom, bbox_right+xsp, bbox_bottom+ysp, objTopSolid, false, true);
						}
    
						var i;
						for(i = 0; i < totalTSs; i += 1)
							instance_activate_object(platformID[i]);
					}
					else if place_meeting(x + xsp, y + ysp, prtMovingPlatformJumpthrough) && ysp > 0
					{
						var pltfm, totalPlatforms, endCheck;
					    pltfm = collision_rectangle(bbox_left+xsp, bbox_bottom, bbox_right+xsp, bbox_bottom+ysp, prtMovingPlatformJumpthrough, false, true);
					    totalPlatforms = 0;
						endCheck = false;
					    while pltfm >= 0 && endCheck == false
					    {
					        if pltfm.id == movedPlatformID || movedPlatformID == -20
					        {
					            if pltfm.dead == false
					            {
					                if bbox_bottom <= pltfm.bbox_top+1
					                {
					                    proceed = false;
										if pltfm.yspeed > 0
											y = pltfm.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
										
										endCheck = true;
					                }
					            }
					            break;
					        }
        
					        platformID[totalPlatforms] = pltfm;
					        instance_deactivate_object(pltfm);
					        totalPlatforms += 1;
					        pltfm = collision_rectangle(bbox_left+xsp, bbox_bottom, bbox_right+xsp, bbox_bottom+ysp, prtMovingPlatformJumpthrough, false, true);
					    }
		
						var i;
					    for(i = 0; i < totalPlatforms; i += 1)
					        instance_activate_object(platformID[i]);
					}
					else if place_meeting(x + xsp, y + ysp, objSolid) 
					|| place_meeting(x + xsp, y + ysp, prtMovingPlatformSolid)
					{
						proceed = false;
						if place_meeting(x + xsp, y + ysp, objSolid)
						{
							var mySolid = instance_place(x + xsp, y + ysp, objSolid)
							if ysp > 0 && !place_meeting(x, y, mySolid)
								y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
						}
						else if place_meeting(x + xsp, y + ysp, prtMovingPlatformSolid)
						{
							var mySolid = instance_place(x + xsp, y + ysp, prtMovingPlatformSolid)
							if mySolid.yspeed > 0
								y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
						}
					}
				}
                instance_activate_object(other.id);
                
                if proceed == true
                {
                    movedByPlatform = true;
                    x += xsp;
                    y += ysp;
                    y = round(y);
                    
                    if ysp < 0
                    {
                        var origY, attempts;
                        origY = y;
                        attempts = 0;
                        while !place_meeting(x, y + 1, other.id) && attempts < 100
                        {
                            y += 1;
                            attempts += 1;
                        }
                        
                        if attempts >= 100
                            y = origY;
                    }
                    
                    var origY, attempts;
                    origY = y;
                    attempts = 0;
                    while place_meeting(x, y, other.id) && attempts < 100
                    {
                        y -= 1;
                        attempts += 1;
                    }
                    
                    if attempts >= 100
                        y = origY;
                    
                    ground = true;
                }
            }
        }
    }
}

