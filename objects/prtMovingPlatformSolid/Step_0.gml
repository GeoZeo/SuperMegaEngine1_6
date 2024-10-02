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

if dead == false
{
	var prev_x = x;
	var prev_y = y;
	
	if global.frozen == false
	{
		x += xspeed * update_rate;
	    y += yspeed * update_rate;
		
		prev_x = x;
		prev_y = y;
		
		if is_int(xspeed * update_rate) or xspeed == 0 x = round(x);
		if is_int(yspeed * update_rate) or yspeed == 0 y = round(y);
	}
	
	if !instance_exists(objSectionSwitcher)
	{
		// Push the player in the direction we're moving
	    if place_meeting(x, y, prtPlayer) && (insideView_Spr() or insideViewObj_Spr(prtPlayer))
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
					prtPlayer.y -= upDist;
					prtPlayer.pltSpeedY = (yspeed * update_rate) + (y - prev_y);
					if yspeed >= 0 && !is_int((yspeed * update_rate) + (y - prev_y))
						prtPlayer.y += ((yspeed * update_rate) + (y - prev_y)) % 1;
					//print("Don't Crush - Up");
				}
	            else if minDist == leftDist || (xspeed < 0 && abs(minDist - leftDist) <= 3)
				{
					prtPlayer.x -= leftDist;
					prtPlayer.pltSpeedX = (xspeed * update_rate) + (x - prev_x);
					//print("Don't Crush - Left");
				}
				else if minDist == rightDist || (xspeed > 0 && abs(minDist - rightDist) <= 3)
				{
	                prtPlayer.x += rightDist;
					prtPlayer.pltSpeedX = (xspeed * update_rate) + (x - prev_x);
					//print("Don't Crush - Right");
				}
				else if minDist == downDist || (yspeed > 0 && abs(minDist - downDist) <= 3)
				{				
					prtPlayer.y += downDist;
					prtPlayer.pltSpeedY = (yspeed * update_rate) + (y - prev_y);
					//print("Don't Crush - Down");
				
					//Just in case we're pushed down onto another moving solid
					with prtPlayer
					{
						if place_meeting(x, y+1, prtMovingPlatformSolid)
						{
							var myPlt = instance_place(x, y+1, prtMovingPlatformSolid)
							{
								if myPlt >= 0 && !myPlt.dead
								{
									ground = true;
									global.yspeed = 0;
								}
							}
						}
					}
				}
                
	            // Crush the player if necessary
	            with prtPlayer
	            {
	                instance_deactivate_object(other.id);
	                var movingPltfm, meetingPlatform;
	                movingPltfm = collision_rectangle(bbox_left+2, bbox_top+2 - ((isSlide or isStun) * 2), bbox_right-2, bbox_bottom-2 + ((isSlide or isStun) * 2), prtMovingPlatformSolid, false, false);
                
	                meetingPlatform = false;
	                if movingPltfm >= 0
	                {
	                    if movingPltfm.dead == false
	                        meetingPlatform = true;
	                }
                
	                if collision_rectangle(bbox_left+2, bbox_top+2 - ((isSlide or isStun) * 2), bbox_right-2, bbox_bottom + ((isSlide or isStun) * 2), objSolid, false, false)
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
        
	    if place_meeting(x, y - checkYspeed - 1, prtPlayer) && (insideView_Spr() or insideViewObj_Spr(prtPlayer) or yspeed >= 0)
	    {
	        if prtPlayer.ground == true && prtPlayer.bbox_bottom <= bbox_top + abs(yspeed) + abs(global.yspeed) + 2
	        && prtPlayer.movedByPlatform == false && prtPlayer.teleporting == false
	        && prtPlayer.showReady == false
			&& !(instance_exists(objBeat) and objBeat.carrying)
	        {
	            with prtPlayer
	            {
	                var proceed, xsp, ysp;
	                proceed = true;
	                xsp = (other.xspeed * other.update_rate) + (other.x - prev_x);
	                ysp = (other.yspeed * other.update_rate) + (other.y - prev_y);
					pltSpeedX = xsp;
					pltSpeedY = ysp;
                
	                instance_deactivate_object(other.id);
	                if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objSolid) 
					|| place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformSolid)
					|| (place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objTopSolid) && ysp > 0)
					|| (place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformJumpthrough) && ysp > 0)
					{
						if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objTopSolid) && ysp > 0
						{
							var tpsld, totalTSs, endCheck;
							tpsld = collision_rectangle(bbox_left + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, objTopSolid, false, true);
							totalTSs = 0;
							endCheck = false;
							while tpsld >= 0 && endCheck == false
							{
								if bbox_bottom <= tpsld.bbox_top
								{
									proceed = false;
									if ysp > 0 && !place_meeting(x, y, tpsld)
										y = tpsld.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
									endCheck = true;
									break;
								}
        
								platformID[totalTSs] = tpsld;
								instance_deactivate_object(tpsld);
								totalTSs += 1;
								tpsld = collision_rectangle(bbox_left + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, objTopSolid, false, true);
							}
    
							var i;
							for(i = 0; i < totalTSs; i += 1)
								instance_activate_object(platformID[i]);
						}
						else if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformJumpthrough) && ysp > 0
						{
							var pltfm, totalPlatforms, endCheck;
						    pltfm = collision_rectangle(bbox_left + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, prtMovingPlatformJumpthrough, false, true);
						    totalPlatforms = 0;
							endCheck = false;
						    while pltfm >= 0 && endCheck == false
						    {
						        if pltfm.id == movedPlatformID || movedPlatformID == -20
						        {
						            if pltfm.dead == false
						            {
						                if bbox_bottom <= pltfm.bbox_top
						                {
						                    proceed = false;
											if pltfm.yspeed > 0
												y = pltfm.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
										
											endCheck = true;
						                }
						            }
						            break;
						        }
        
						        platformID[totalPlatforms] = pltfm;
						        instance_deactivate_object(pltfm);
						        totalPlatforms += 1;
						        pltfm = collision_rectangle(bbox_left + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right + (xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, prtMovingPlatformJumpthrough, false, true);
						    }
		
							var i;
						    for(i = 0; i < totalPlatforms; i += 1)
						        instance_activate_object(platformID[i]);
						}
						else if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objSolid) 
						|| place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformSolid)
						{
							if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objSolid)
							{
								var mySolid = instance_place(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objSolid)
								if ysp > 0 && !place_meeting(x, y, mySolid)
									y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
								
								proceed = false;
							}
							else if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformSolid)
							{
								var mySolid = instance_place(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformSolid)
								if !mySolid.dead
								{
									if mySolid.yspeed > 0 && bbox_bottom < sprite_get_ycenter_object(mySolid)
										y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
									
									proceed = false;
								}
							}
						}
					}
	                instance_activate_object(other.id);
                
	                if proceed == true && global.frozen == false
	                {
	                    movedByPlatform = true;
	                    
						instance_deactivate_object(other.id);
						if global.yspeed == 0 && (!place_meeting(x+xsp, y, prtMovingPlatformSolid)
						|| instance_place(x+xsp, y, prtMovingPlatformSolid).dead)
						{
							if abs(xsp) < 1 && abs(xsp) > 0 && !place_free(x + (-sign(xsp) - -xsp), y)
							{
								xsp = sign(xsp) - xsp;
							}
							x += xsp;
						}
						instance_activate_object(other.id);
	                    
						y += ysp;
						
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
						
						instance_deactivate_object(other.id);
						if global.yspeed == 0 && (!place_meeting(x, y, prtMovingPlatformSolid)
						|| instance_place(x, y, prtMovingPlatformSolid).dead)
							escapeWall(true, true, false, false);
						instance_activate_object(other.id);
	                }
	            }
	        }
	    }
	}
}

