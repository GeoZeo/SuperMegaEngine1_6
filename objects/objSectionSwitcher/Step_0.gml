//Moving the screen and player (or rather, both the player and the clone of the player. See create event for more information on that)

if canStep == true && (playerSpeedHorDoor != 0 && playerSpeedVertDoor != 0) //When the door is closing, we should not move
{
    if !(door == true && canProgressDoor == false)
    {
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
                    prtPlayer.visible = true;
                    instance_destroy();
                    with prtPlayer playerDeactivateObjects();
                }
                else
                {
                    var bossdr;
                    bossdr = instance_place(prtPlayer.sectionLeft, y, objBossDoor);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        image_speed = 0;
                        playSFX(sfxDoor);
                        
                        playerSpeedHorDoor = 0;
                    }
                    else
                    {
                        global.frozen = false;
                        prtPlayer.visible = true;
                        instance_destroy();
                        with prtPlayer playerDeactivateObjects();
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
                    prtPlayer.visible = true;
                    instance_destroy();
                    with prtPlayer playerDeactivateObjects();
                }
                else
                {
                    var bossdr;
                    bossdr = instance_place(prtPlayer.sectionRight, y, objBossDoor);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        image_speed = 0;
                        playSFX(sfxDoor);
                        
                        playerSpeedHorDoor = 0;
                    }
                    else
                    {
                        global.frozen = false;
                        prtPlayer.visible = true;
                        instance_destroy();
                        with prtPlayer playerDeactivateObjects();
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
                    prtPlayer.visible = true;
                    instance_destroy();
                    with prtPlayer playerDeactivateObjects();
                    instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
                }
                else
                {
                    var bossdr;
                    bossdr = instance_place(x, prtPlayer.sectionTop, objBossDoorH);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        image_speed = 0;
                        playSFX(sfxDoor);
                        
                        playerSpeedVertDoor = 0;
                    }
                    else
                    {
                        global.frozen = false;
                        prtPlayer.visible = true;
                        instance_destroy();
                        with prtPlayer playerDeactivateObjects();
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
                    prtPlayer.visible = true;
                    instance_destroy();
                    with prtPlayer playerDeactivateObjects();
                }
                else
                {
                    var bossdr;
                    bossdr = instance_place(x, prtPlayer.sectionBottom, objBossDoorH);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        image_speed = 0;
                        playSFX(sfxDoor);
                        
                        playerSpeedVertDoor = 0;
                    }
                    else
                    {
                        global.frozen = false;
                        prtPlayer.visible = true;
                        instance_destroy();
                        with prtPlayer playerDeactivateObjects();
                    }
                }                                        
            }
            
            
        }
        
		if sprite_index == prtPlayer.spriteSlide prtPlayer.slideTimer++; //Comment this out if you don't want slides to be cancelled upon the end of a section switch
		
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
    }
}


//Quick weapon switching
if cfgSwitchWeaponsWhileTransitioning
	with prtPlayer playerSwitchWeapons();

//Optionally continue charge animations during scrolling. Comment this out if you only want charge animations to persist when MM is locked (i.e: during a boss cutscene, for example).
if cfgContinueChargeAnimWhileLocked || cfgChargeWhileLocked
	with prtPlayer playerShoot();