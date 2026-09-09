if (global.eddieInstance == -1 or global.eddieInstance == id) && (!teleporting or called or (myItem == -1 or !instance_exists(myItem)))
{
	if teleporting == false && leaving == false
	{
		global.eddieInstance = id;
	    drawSelf();
	}
	else if teleporting == true && insideView_Spr()
	{
		global.eddieInstance = id;
	    if round(global.viewY-16+teleportY) >= y && (shouldLand == true or !called)
	    {
	        if teleportTimer == 0 && playTeleportSound {
				playSFX(sfxTeleportIn);
				playTeleportSound = false;
			}
        
	        //Done teleporting; play a little animation before giving Mega Man control
	        if teleportTimer != 9   //Rush disappears for one frame
	            drawSelf();
        
	        if teleportTimer == 2
	            image_index = 1;
	        else if teleportTimer == 4
	            image_index = 0;
	        else if teleportTimer == 6
	            image_index = 2;
	        else if (teleportTimer = 9
			&& !(collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false)
			or collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objBossDoor, false, false)
			or (collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, prtMovingPlatformSolid, false, false)
			and !collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, prtMovingPlatformSolid, false, false).dead)))
	        || (teleportTimer == 15
			&& (collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false)
			or collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objBossDoor, false, false)
			or (collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, prtMovingPlatformSolid, false, false)
			and !collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, prtMovingPlatformSolid, false, false).dead)))
	        {
	            teleporting = false;
	            teleportTimer = 0;
	            teleportY = 0;
				currentTeleportSpeed = 0;
				playTeleportSound = true;
	            sprite_index = sprEddie;
				mask_index = sprEddie;
				image_speed = anim_spd * 2;
	            image_index = 1;
				if player_x < x {
	                image_xscale = -1;
	            }
				else if image_xscale < 0 {
					image_xscale = 1;
				}
	            exit;
	        }
        
	        if global.frozen == false
	            teleportTimer += 1;
	    }
	    else if round(global.viewY-16+teleportY) >= global.viewY+global.viewHeight
	    {
			//Teleporting downwards
	        draw_sprite_ext(sprite_index, image_index, round(x), round(global.viewY-16+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
		
	        global.eddieInstance = -1;
			
			if called
			{
				instance_destroy();
			}
			else
			{
				if itemCollected instance_destroy();
			}
	    }
	    else
	    {
	        //Teleporting downwards
	        draw_sprite_ext(sprite_index, image_index, round(x), round(global.viewY-16+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        
			if recalcSpawn && called
			{
				if instance_exists(prtPlayer)
				and ((prtPlayer.image_xscale >= 0 and prtPlayer.x - x <= 0) or (prtPlayer.image_xscale <= 0 and prtPlayer.x - x >= 0))
				{
					var tpY, airIncrease;
				    tpY = 0;
				    if prtPlayer.ground
				        airIncrease = 0;
				    else
				        airIncrease = 12; //When in the air, the upwards range is reduced because Rush could otherwise spawn above ceilings
    
    
				    ///Spawn position calculation system
					if newSystem {
						///NEW SYSTEM: functions more like Mega Man Maker. Allows Rush to automatically spawn up to 4 tiles above or 3 tiles below MM where a spot is available.
						y = prtPlayer.y + airIncrease;
						shouldLand = false;
						var _initY = y;
						var _bottomY = -1000000;
						var _topY = -1000000;
		
						var _mask = mask_index;
						mask_index = sprRushTeleportMask;
						checkGround();
						mask_index = _mask;
						if collision_rectangle_free(x-5, bbox_top, x+5, bbox_bottom, false, true, true) && ground
						{
							shouldLand = true; ///If there's already a spot available directly in front of MM, we don't need to do anything else.
						}
		
						if !shouldLand {
			
							y = _initY;
			
							while tpY <= lowerSpawnCap && y < global.viewY + global.viewHeight && _bottomY == -1000000 {
								_mask = mask_index;
								mask_index = sprRushTeleportMask;
								checkGround();
								mask_index = _mask;
								if collision_rectangle_free(x-5, bbox_top, x+5, bbox_bottom, false, true, true) && ground
								{
									_bottomY = y;
								}
								else {
									y++;
									tpY++;
								}
							}
			
							y = _initY;
							tpY = 0;
			
							while tpY <= upperSpawnCap && y >= global.viewY && _topY == -1000000 {
								_mask = mask_index;
								mask_index = sprRushTeleportMask;
								checkGround();
								mask_index = _mask;
								if collision_rectangle_free(x-5, bbox_top, x+5, bbox_bottom, false, true, true) && ground
								{
									_topY = y;
								}
								else {
									y--;
									tpY++;
								}
							}
			
							y = _initY;
			
							///Whichever available spot between the closest upper spot and the closest lower spot is the closest to Rush's original position, we spawn him there.
							if _bottomY != -1000000 && ((_bottomY - y < y - _topY or (_bottomY - y == y - _topY and !upperPriority)) or _topY == -1000000) {
								shouldLand = true;
								y = _bottomY;
							}
							else if _topY != -1000000 && ((y - _topY < _bottomY - y or (y - _topY == _bottomY - y and upperPriority)) or _bottomY == -1000000) {
								shouldLand = true;
								y = _topY;
							}
							///Currently, in the event that the two distances are equal, upper spots will be prioritised since worst-case scenario, we'll be travelling further up than down.
						}
					}
					else {
						///OLD SYSTEM: functions more like Rush in MM9 and 10. Eddie will not land if there isn't a spot available directly in front of MM.
						while !(!position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objSolid) && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objBossDoorH) && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformSolid)
					    && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objTopSolid) && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
					    && (position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH) || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid)
					    || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough)))
					    && !(position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
						&& !(position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
					    && !(position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
					    && !(position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
					    && !(position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough) && tpY > sprite_get_height(prtPlayer.mask_index)/2)
					    && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoor)
					    && tpY <= 12+52 {
					        tpY++;
					    }
    
					    if position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid)
						|| position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH)
					    || position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid)
					    || position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid)
					    || position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough) {
					        if position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)+tpY, objSolid);
					            y = solidID.y-16;
					        }
							else if position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)+tpY, objBossDoorH);
					            y = solidID.y-16;
					        }
					        else if position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformSolid);
					            y = solidID.bbox_top-16;
					        }
					        else if position_meeting(x, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)+tpY, objTopSolid);
					            y = solidID.y-16;
					        }
					        else {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)+tpY, prtMovingPlatformJumpthrough);
					            y = solidID.bbox_top-16;
					        }
					    }
					    else if !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objSolid)
						&& !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objBossDoorH)
					    && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformSolid)
					    && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objTopSolid)
					    && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
					    && !position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY-1 + airIncrease, objBossDoor)
					    && (position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH) || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid)
					    || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) || position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough)) {
					        if position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objSolid);
					            y = solidID.y-16;
					        }
							else if position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objBossDoorH);
					            y = solidID.y-16;
					        }
					        else if position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformSolid);
					            y = solidID.bbox_top-16;
					        }
					        else if position_meeting(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid) {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, objTopSolid);
					            y = solidID.y-16;
					        }
					        else {
					            var solidID = instance_position(x, sprite_get_ycenter_object(prtPlayer)-tpY + airIncrease, prtMovingPlatformJumpthrough);
					            y = solidID.bbox_top-16;
					        }
					    }
					    else {
					        y = sprite_get_ycenter_object(prtPlayer);
					    }
					}
				}
			}
		
			if global.frozen == false {
				if abs(cfgRushTeleportAcc) > 0 {
					currentTeleportSpeed += abs(cfgRushTeleportAcc);
					if currentTeleportSpeed >= abs(cfgRushTeleportSpeed) {
						currentTeleportSpeed = abs(cfgRushTeleportSpeed);
					}
				}
				else {
					currentTeleportSpeed = abs(cfgRushTeleportSpeed);
				}
		
				teleportY += currentTeleportSpeed;
			}
	    }
	}
	else if leaving == true && insideView_Spr()
	{
		global.eddieInstance = id;
		
	    if teleportY == 0
	    {
	        //Done teleporting; play a little animation before giving Mega Man control
	        if teleportTimer != 9   //Rush disappears for one frame
	            drawSelf();
        
	        if teleportTimer == 2
	            image_index = 2;
	        else if teleportTimer == 4
	            image_index = 0;
	        else if teleportTimer == 6
	            image_index = 1;
	        else if teleportTimer = 9
	        {
				if abs(cfgRushTeleportAcc) > 0 {
					currentTeleportSpeed += abs(cfgRushTeleportAcc);
					if currentTeleportSpeed >= abs(cfgRushTeleportSpeed) {
						currentTeleportSpeed = abs(cfgRushTeleportSpeed);
					}
				}
				else {
					currentTeleportSpeed = abs(cfgRushTeleportSpeed);
				}
			
	            teleportY -= currentTeleportSpeed;
	            image_speed = 0;
	            image_index = 0;
	            exit;
	        }
        
	        if global.frozen == false
	            teleportTimer += 1;
	    }
	    else
	    {
	        //Teleporting upwards
	        draw_sprite_ext(sprite_index, image_index, round(x), round(y+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        
	        if global.frozen == false {
				if abs(cfgRushTeleportAcc) > 0 {
					currentTeleportSpeed += abs(cfgRushTeleportAcc);
					if currentTeleportSpeed >= abs(cfgRushTeleportSpeed) {
						currentTeleportSpeed = abs(cfgRushTeleportSpeed);
					}
				}
				else {
					currentTeleportSpeed = abs(cfgRushTeleportSpeed);
				}
			
	            teleportY -= currentTeleportSpeed;
			}
        
	        if round(y+16+teleportY) <= global.viewY || round(y+16+teleportY) <= 0
			{
				global.eddieInstance = -1;
				
	            if called
				{
					instance_destroy();
				}
				else
				{
					if itemCollected instance_destroy();
					//instance_deactivate_object(id);
				}
			}
	    }
	}
}

if debug_mode || cfgDebug {
    draw_set_color(c_white);
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
    draw_arrow(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter() + xspeed * 10, sprite_get_ycenter() + yspeed * 10, 10);
}

