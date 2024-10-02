event_inherited();

//If transitioning on top of a moving platform, move the platform at the same speed as Mega Man
//Different conditions for browser or desktop, at least until this issue is better understood
if object_index != objRushJet {
	if keepOnSwitch && global.frozen && !dead && instance_exists(objSectionSwitcher) && instance_exists(prtPlayer) && ( (os_browser == browser_not_a_browser && place_meeting(x, y-1, prtPlayer) ) || (os_browser != browser_not_a_browser && place_meeting(x, bbox_top-1, prtPlayer) )) && objSectionSwitcher.plt == self {
	    x += objSectionSwitcher.playerSpeedHor * sign(xspeed);

	    //Small hop workaround
	    if os_browser == browser_not_a_browser
	        y += objSectionSwitcher.playerSpeedVert * sign(yspeed);
	    else
	        y = prtPlayer.bbox_bottom + sprite_yoffset + 1 + objSectionSwitcher.playerSpeedVert;
	}
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
		with prtPlayer
			other.placeFree = place_free(x, y - (abs(other.yspeed) + abs(global.yspeed)))
	
	    if place_meeting(x, y, prtPlayer) && prtPlayer.bbox_bottom <= bbox_top + abs(yspeed) + abs(global.yspeed) && yspeed < 0 && (insideView_Spr() or insideViewObj_Spr(prtPlayer))
	    {
			// Carry the player upwards off of another platform
			if placeFree
			{
				if prtPlayer.teleporting == false && prtPlayer.showReady == false
		        {
		            var upDist, attempts;
		            upDist = 0;
            
		            attempts = 0;
		            while place_meeting(x, y + upDist, prtPlayer) && attempts < 500
		            {
		                upDist += 1;
		                attempts += 1;
		            }
  
					prtPlayer.pltSpeedY = (yspeed * update_rate) + (y - prev_y);
		            prtPlayer.y -= upDist;
					if yspeed >= 0 && !is_int((yspeed * update_rate) + (y - prev_y))
						prtPlayer.y += ((yspeed * update_rate) + (y - prev_y)) % 1;
				}
			}
			//Drop the player if they hit a ceiling while on a platform
			else
			{
				with prtPlayer
				{
					if teleporting == false && showReady == false
			        {	
			            var downDist, attempts;
			            downDist = 0;
            
			            attempts = 0;
			            while !place_free(x, y + downDist) && attempts < 500
			            {
			                downDist += 1;
			                attempts += 1;
			            }
  
			            y += downDist;
					
						if place_meeting(x, y+1, prtMovingPlatformSolid)
						{
							var myPlt = instance_place(x, y+1, prtMovingPlatformSolid)
							{
								if myPlt >= 0 && !myPlt.dead
								{
									ground = true;
									global.yspeed = 0;
								
									//Crush the player if necessary
									if place_free(x, y - (abs(other.yspeed) + abs(global.yspeed)))
										y = myPlt.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
									else
										global._health = 0;
								}
							}
						}
					}
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
	        var useYspeed;
	        useYspeed = yspeed;
        
	        var canProceed;
	        canProceed = false;
	        if prtPlayer.movedPlatformID == id || prtPlayer.movedPlatformID == -20
	            canProceed = true;
	        else if instance_exists(prtPlayer.movedPlatformID) && prtPlayer.movedPlatformID.yspeed == useYspeed && abs(prtPlayer.movedPlatformID.bbox_top - bbox_top) <= useYspeed + 3
	            canProceed = true;
            
	        if prtPlayer.ground == true && prtPlayer.bbox_bottom <= bbox_top + abs(yspeed) + abs(global.yspeed) + 2
	        && prtPlayer.movedByPlatform == false && canProceed == true
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
                
	                if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objSolid) || place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformSolid)
					{
						if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objSolid)
						{
							var mySolid = instance_place(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objSolid)
							if ysp > 0 && !place_meeting(x, y, mySolid)
								y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
							
							if onRushJet == true
							{
								onRushJet = false;
								canWalk = true;
							}
							proceed = false;
						}
						else if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformSolid)
						{
							var mySolid = instance_place(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, prtMovingPlatformSolid)
							if !mySolid.dead
							{
								if mySolid.yspeed > 0 && bbox_bottom < sprite_get_ycenter_object(mySolid)
									y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
								
								if onRushJet == true
								{
									onRushJet = false;
									canWalk = true;
								}
								proceed = false;
							}
						}
					}
					
					if proceed == true
					{
						//Check for other jump-through moving platforms
						var myPltJumpthrough = -1;
				
						var pltfm, totalPlatforms, endCheck;
						pltfm = collision_rectangle(bbox_left+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, prtMovingPlatformJumpthrough, false, true);
						totalPlatforms = 0;
						endCheck = false;
						while pltfm >= 0 && endCheck == false
						{
						    if pltfm.id != movedPlatformID || movedPlatformID == -20
						    {
						        if pltfm.dead == false
						        {
						            myPltJumpthrough = pltfm;
									endCheck = true;
						        }
						    }
        
						    platformID[totalPlatforms] = pltfm;
						    instance_deactivate_object(pltfm);
						    totalPlatforms += 1;
						    pltfm = collision_rectangle(bbox_left+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, prtMovingPlatformJumpthrough, false, true);
						}
		
						var i;
						for(i = 0; i < totalPlatforms; i += 1)
						    instance_activate_object(platformID[i]);
					
						if (place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objTopSolid) && ysp > 0)
						|| ((myPltJumpthrough >= 0 and myPltJumpthrough.id != other.id) && ysp > 0)
						{
							if place_meeting(x + (xsp * place_free(x+xsp, y+ysp)), y + ysp, objTopSolid) && ysp > 0
							{
								var tpsld, totalTSs, _endCheck;
								tpsld = collision_rectangle(bbox_left+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, objTopSolid, false, true);
								totalTSs = 0;
								_endCheck = false;
								while tpsld >= 0 && _endCheck == false
								{
									if bbox_bottom <= tpsld.bbox_top
									{
										if onRushJet == true
										{
										    onRushJet = false;
										    canWalk = true;
										}
										proceed = false;
										if ysp > 0 && !place_meeting(x, y, tpsld)
											y = tpsld.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
										_endCheck = true;
										break;
									}
        
									platformID[totalTSs] = tpsld;
									instance_deactivate_object(tpsld);
									totalTSs += 1;
									tpsld = collision_rectangle(bbox_left+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom, bbox_right+(xsp * place_free(x+xsp, y+ysp)), bbox_bottom+ysp, objTopSolid, false, true);
								}
    
								var i;
								for(i = 0; i < totalTSs; i += 1)
									instance_activate_object(platformID[i]);
							}
							else if (myPltJumpthrough >= 0 and myPltJumpthrough.id != other.id) && ysp > 0 && (myPltJumpthrough.yspeed * other.update_rate) < ysp
							{
								if bbox_bottom <= myPltJumpthrough.bbox_top
								{
									if myPltJumpthrough.object_index != objRushJet
									{
										if onRushJet == true
										{
										    onRushJet = false;
										    canWalk = true;
										}
									}
									proceed = false;
									if myPltJumpthrough.yspeed > 0
										y = (myPltJumpthrough.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1) + (myPltJumpthrough.yspeed * other.update_rate);
								}
							}
						}
					}
                
	                if proceed == true && global.frozen == false
	                {
	                    movedByPlatform = true;
                    
	                    if movedPlatformID == -20
	                        movedPlatformID = other.id;
                        
	                    if abs(xsp) < 1 && abs(xsp) > 0 && !place_free(x + (-sign(xsp) - -xsp), y)
						{
							xsp = sign(xsp) - xsp;
						}
						
						x += xsp;
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
						
						escapeWall(true, true, false, false);
	                }
	            }
	        }
	    }
	}
}

