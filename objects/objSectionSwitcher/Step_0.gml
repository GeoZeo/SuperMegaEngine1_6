if !instance_exists(objAchievementBox)
{
	//Disabling buffering
	
	if cfgEnableBuffering
	{
		if global.keyJump global.hasJumped = true;
		if global.keyWeaponSwitchLeft global.hasSwitchedL = true;
		if global.keyWeaponSwitchRight global.hasSwitchedR = true;
	
		if global.enableSlideKey
			if global.keySlide global.hasSlid = true;
	}

	//Moving the screen and player (or rather, both the player and the clone of the player. See create event for more information on that)

	if canStep == true && (playerSpeedHorDoor != 0 && playerSpeedVertDoor != 0) //When the door is closing, we should not move
	{
	    if !(door == true && canProgressDoor == false)
	    {
			if sliding prtPlayer.slideTimer++; //Comment this line out if you don't want section switches to always automatically cancel slides
			if prtPlayer.slideTimer >= prtPlayer.slideFrames
			{
				cancelSlide = true;
			}
		
	        //Right
	        if dir == "right"
	        {	
	            global.viewX += screenSpeedHor;
            
	            if door == false
	            {
					var prevX = x;
				
	                x += playerSpeedHor;
	                prtPlayer.x += playerSpeedHor;
					//If there was a moving platform below Mega Man, adjust it accordingly
					if prtPlayer.ground == true && plt >= 0 && plt.keepOnSwitch && plt.transitionSideways {
					    plt.x += abs(x - prevX);
					}
	            }
	            else
	            {
					var prevX = x;
				
	                x += playerSpeedHorDoor;
	                prtPlayer.x += playerSpeedHorDoor;
					//If there was a moving platform below Mega Man, adjust it accordingly
					if prtPlayer.ground == true && plt >= 0 && plt.keepOnSwitch && plt.transitionSideways {
					    plt.x += abs(x - prevX);
					}
	            }
            
	            if global.viewX >= prtPlayer.sectionLeft
	            {
	                global.viewX = prtPlayer.sectionLeft;
                
	                if door == false
	                {
	                    global.frozen = false;
						with prtPlayer canPause = true;
	                    prtPlayer.visible = true;
	                    instance_destroy();
	                    with prtPlayer playerDeactivateObjects();
						instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
						with prtPlayer escapeWall(true, true, false, false);
	                }
	                else
	                {
	                    var bossdr;
	                    bossdr = instance_place(prtPlayer.sectionLeft, y, objBossDoor);
	                    if bossdr >= 0
	                    {
	                        bossdr.opening = false;
	                        bossdr.closing = true;
	                        image_speed = imgSpd; //Change from 0 to imgSpd if you want animations to play during door closings.
	                        playSFX(sfxDoor);
                        
	                        playerSpeedHorDoor = 0;
	                    }
	                    else
	                    {
	                        global.frozen = false;
							with prtPlayer canPause = true;
	                        prtPlayer.visible = true;
	                        instance_destroy();
	                        with prtPlayer playerDeactivateObjects();
							instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
							with prtPlayer escapeWall(true, true, false, false);
	                    }
	                }
					if cancelSlide
					{
						with prtPlayer
						{
							if place_free(x, y-7)
							{
								if !place_meeting(x, y+1, objIce)
								    global.xspeed = 0;
								else
								    global.xspeed = walkSpeed * image_xscale;
							}
						}
					}
	            }
	        }
        
	        //Left
	        else if dir == "left"
	        {
	            global.viewX -= screenSpeedHor;
            
	            if door == false
	            {
					var prevX = x;
				
	                x -= playerSpeedHor;
	                prtPlayer.x -= playerSpeedHor;
					//If there was a moving platform below Mega Man, adjust it accordingly
					if prtPlayer.ground == true && plt >= 0 && plt.keepOnSwitch && plt.transitionSideways {
					    plt.x -= abs(x - prevX);
					}
	            }
	            else
	            {
					var prevX = x;
				
	                x -= playerSpeedHorDoor;
	                prtPlayer.x -= playerSpeedHorDoor;
					//If there was a moving platform below Mega Man, adjust it accordingly
					if prtPlayer.ground == true && plt >= 0 && plt.keepOnSwitch && plt.transitionSideways {
					    plt.x -= abs(x - prevX);
					}
	            }
            
	            if global.viewX <= prtPlayer.sectionRight-global.viewWidth
	            {
	                global.viewX = prtPlayer.sectionRight-global.viewWidth;
                
	                if door == false
	                {
	                    global.frozen = false;
						with prtPlayer canPause = true;
	                    prtPlayer.visible = true;
	                    instance_destroy();
	                    with prtPlayer playerDeactivateObjects();
						instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
						with prtPlayer escapeWall(true, true, false, false);
	                }
	                else
	                {
	                    var bossdr;
	                    bossdr = instance_place(prtPlayer.sectionRight, y, objBossDoor);
	                    if bossdr >= 0
	                    {
	                        bossdr.opening = false;
	                        bossdr.closing = true;
	                        image_speed = imgSpd; //Change from 0 to imgSpd if you want animations to play during door closings.
	                        playSFX(sfxDoor);
                        
	                        playerSpeedHorDoor = 0;
	                    }
	                    else
	                    {
	                        global.frozen = false;
							with prtPlayer canPause = true;
	                        prtPlayer.visible = true;
	                        instance_destroy();
	                        with prtPlayer playerDeactivateObjects();
							instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
							with prtPlayer escapeWall(true, true, false, false);
	                    }
	                }
					if cancelSlide
					{
						with prtPlayer
						{
							if place_free(x, y-7)
							{
								if !place_meeting(x, y+1, objIce)
								    global.xspeed = 0;
								else
								    global.xspeed = walkSpeed * image_xscale;
							}
						}
					}
	            }
	        }
        
	        //Down
	        else if dir == "down"
	        {
	            global.viewY += screenSpeedVert;
            
	            if door == false
	            {
	                y += playerSpeedVert;
	                prtPlayer.y += playerSpeedVert;
	            }
	            else
	            {
	                y += playerSpeedVertDoor;
	                prtPlayer.y += playerSpeedVertDoor;
	            }            
            
				//If there was a moving platform below Mega Man, adjust it to remain below him
				if prtPlayer.ground == true && plt >= 0 && plt.keepOnSwitch {
					plt.y = prtPlayer.bbox_bottom + plt.sprite_yoffset;
				}
			
	            if global.viewY >= prtPlayer.sectionTop
	            {
	                global.viewY = prtPlayer.sectionTop;
                
	                if door == false
	                {
	                    global.frozen = false;
						with prtPlayer canPause = true;
	                    prtPlayer.visible = true;
	                    instance_destroy();
	                    with prtPlayer playerDeactivateObjects();
	                    instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
						with prtPlayer escapeWall(false, false, true, true);
	                }
	                else
	                {
	                    var bossdr;
	                    bossdr = instance_place(x, prtPlayer.sectionTop, objBossDoorH);
	                    if bossdr >= 0
	                    {
	                        bossdr.opening = false;
	                        bossdr.closing = true;
	                        image_speed = imgSpd; //Change from 0 to imgSpd if you want animations to play during door closings.
	                        playSFX(sfxDoor);
                        
	                        playerSpeedVertDoor = 0;
	                    }
	                    else
	                    {
	                        global.frozen = false;
							with prtPlayer canPause = true;
	                        prtPlayer.visible = true;
	                        instance_destroy();
	                        with prtPlayer playerDeactivateObjects();
							instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
							with prtPlayer escapeWall(false, false, true, true);
	                    }
	                }
					if cancelSlide
					{
						with prtPlayer
						{
							if place_free(x, y-7)
							{
								if !place_meeting(x, y+1, objIce)
								    global.xspeed = 0;
								else
								    global.xspeed = walkSpeed * image_xscale;
							}
						}
					}
	            }
            
                        
	        }
        
	        //Up
	        else if dir == "up"
	        {
	            global.viewY -= screenSpeedVert;
            
	            if door == false
	            {
	                y -= playerSpeedVert;
	                prtPlayer.y -= playerSpeedVert;
	            }
	            else
	            {
	                y -= playerSpeedVertDoor;
	                prtPlayer.y -= playerSpeedVertDoor;
	            } 
			
				//If there was a moving platform below Mega Man, adjust it to remain below him
				if prtPlayer.ground == true && plt >= 0 && plt.keepOnSwitch {
				    plt.y = prtPlayer.bbox_bottom + plt.sprite_yoffset;
				}

	            if global.viewY <= prtPlayer.sectionBottom - global.viewHeight
	            {
	                global.viewY = prtPlayer.sectionBottom - global.viewHeight;

	                if door == false
	                {
	                    global.frozen = false;
						with prtPlayer canPause = true;
	                    prtPlayer.visible = true;
	                    instance_destroy();
	                    with prtPlayer playerDeactivateObjects();
						instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
						with prtPlayer escapeWall(false, false, true, true);
	                }
	                else
	                {
	                    var bossdr;
	                    bossdr = instance_place(x, prtPlayer.sectionBottom, objBossDoorH);
	                    if bossdr >= 0
	                    {
	                        bossdr.opening = false;
	                        bossdr.closing = true;
	                        image_speed = imgSpd; //Change from 0 to imgSpd if you want animations to play during door closings.
	                        playSFX(sfxDoor);
                        
	                        playerSpeedVertDoor = 0;
	                    }
	                    else
	                    {
	                        global.frozen = false;
							with prtPlayer canPause = true;
	                        prtPlayer.visible = true;
	                        instance_destroy();
	                        with prtPlayer playerDeactivateObjects();
							instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
							with prtPlayer escapeWall(false, false, true, true);
	                    }
	                }
					if cancelSlide
					{
						with prtPlayer
						{
							if place_free(x, y-7)
							{
								if !place_meeting(x, y+1, objIce)
								    global.xspeed = 0;
								else
								    global.xspeed = walkSpeed * image_xscale;
							}
						}
					}
	            }
            
            
	        }
		
	        //Climbing animation
	        if sprite_index == prtPlayer.spriteClimb || sprite_index == prtPlayer.spriteClimbDefault
	        {
				if sprite_index != prtPlayer.spriteClimbDefault
				{
					sprite_index = prtPlayer.spriteClimbDefault;
					image_speed = prtPlayer.speedClimbDefault;
				}
				
	            climbTimer += 1;
	            if climbTimer >= 8
	            {
	                image_xscale = -image_xscale;
	                with prtPlayer image_xscale = -image_xscale;
	                climbTimer = 0;
	            }
	        }
		
			if canLock
			{
				if !timerDone and alarm[2] == -1
				{
					instance_activate_object(objBossControl);
					if insideViewAny(objBossControl)
					{
						var myControl = -1;
				
						with objBossControl
						{
							if insideView() myControl = id; break;
						}
				
						with myControl
						{	
							var warp = true;
							with objBossDoor
							{
								if insideRegionPoint(sprite_get_xcenter(), sprite_get_ycenter(), other.x, other.y, other.x + global.viewWidth, other.y + global.viewHeight, true, true) && ((dir == 1 && prtPlayer.x > x) or (dir == -1 && prtPlayer.x <= x)) {
									warp = false;
								}
							}
							with objBossDoorH
							{
								if insideRegionPoint(sprite_get_xcenter(), sprite_get_ycenter(), other.x, other.y, other.x + global.viewWidth, other.y + global.viewHeight, true, true) && ((dir == 1 && prtPlayer.y > y) or (dir == -1 && prtPlayer.y <= y)) {
									warp = false;
								}
							}
							with objTeleport
							{
								if insideRegion(other.x, other.y, other.x + global.viewWidth, other.y + global.viewHeight) {
									warp = false;
								}
							}
							
							var _boss = ((myBoss > -1 and (bossID > -1 and bossID < array_length_1d(global.bossDefeated) and !global.bossDefeated[bossID])) || (myBoss > -1 and (bossPersistent or bossIsClone)))
							&& !(room == cfgInitialStage && global.initialStageClear) //Comment this line out if you want the initial stage boss to be refightable
							
							other.stopMusic = !_boss && (endLevel or warp);
							
							if endLevel || warp
							{
								with other alarm[2] = ceil(4 / 0.15) - 1;
							}
							else if _boss
							{
								with other alarm[2] = ceil(4 / 0.15) - 1;
							}
						}
					}
					instance_deactivate_object(objBossControl);
				}
			}
	    }
	}


	//Blinking animation
	with prtPlayer
	{
		if other.sprite_index == spriteStandDefault {
		
			if blinkImage == 0 or asset_get_index("spr" + global.character.sprName + "StandBlink") == -1
				spriteStandDefault = asset_get_index("spr" + global.character.sprName + "Stand");
			else
				spriteStandDefault = asset_get_index("spr" + global.character.sprName + "StandBlink");
			
			if blinkImage == 0 or asset_get_index("spr" + global.character.sprName + "StandBlink") == -1
				spriteStand = asset_get_index("spr" + global.character.sprName + "Stand");
			else
				spriteStand = asset_get_index("spr" + global.character.sprName + "StandBlink");
		
			blinkTimer++;
			if blinkImage == 0 {
			    if blinkTimer >= blinkTimerMax {
			        blinkImage = 1;
			        blinkTimer = 0;
			    }
			}
			else {
			    if blinkTimer >= blinkDuration {
			        blinkImage = 0;
			        blinkTimer = 0;
			    }
			}
			sprite_index = spriteStandDefault;
			other.sprite_index = spriteStandDefault;
		}
		else {
			blinkTimer = 0;
			blinkImage = 0;
		}
	}


	//Quick weapon switching
	if cfgSwitchWeaponsWhileTransitioning
	{
		with prtPlayer playerSwitchWeapons();
	}
	else
	{
		with prtPlayer
		{
			//Timer
			if drawWeaponIconTimer != -1 {
			    drawWeaponIconTimer--;
			    if drawWeaponIconTimer == 0 {
			        drawWeaponIcon = false;
			    }
			}
		}
	}

	//Optionally continue charge animations during scrolling.
	if global.weapons[global.currentWeapon].chargeWhileScrolling
	|| cfgContinueChargeAnimWhileLocked || cfgChargeWhileLocked //Comment this line out if you only want charge animations to persist when MM is locked (i.e: during a boss cutscene, for example) unless the above returns true.
		with prtPlayer playerShoot();
}
else
{
	if alarm[0] > 0 {
	    alarm[0]++;
	}
	if alarm[1] > 0 {
	    alarm[1]++;
	}
	if alarm[2] > 0 {
	    alarm[2]++;
	}
}