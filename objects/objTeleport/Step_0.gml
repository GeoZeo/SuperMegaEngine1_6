timerLED += 0.1;
if timerLED >= 2 {
    timerLED = 0;
}

if on && createScenery {
	instance_create(x-sceneryXOffset, y-32, objMM3Teleporter);	
	createScenery = false;
}

if (instance_exists(prtPlayer)) {
	if sprite_index == prtPlayer.spriteTeleport {
	    if image_index >= 2 {
	        if !out {
	            visible = false;
	            sprite_index = -1;
	            var fadeoutin = instance_create(x, y, objFadeIn);
	            fadeoutin.blackAlpha = 0;
	            fadeoutin.blackAlphaDecrease = -0.2;
	            fadeoutin.reverse = true;
	            fadeoutin.deactivate = false;
	            alarm[0] = 15;
	            alarm[1] = 30;
	        }
	        else {
	            //instance_activate_object(objMegaman);
				if instance_exists(objBossControl) {
					with instance_nearest(toX, toY, objBossControl) {
		                if !insideView() {
		                    playerFreeMovement();
		                }
		            }
				}
				else {
					playerFreeMovement();
				}
	            prtPlayer.x = toX;
	            prtPlayer.y = toY;
	            prtPlayer.visible = true;
	            prtPlayer.image_xscale = toDir;
	            x = origX;
	            y = origY;            
	            visible = false;
	            sprite_index = sprCollisionOther;
	            out = false;
	            instance_activate_object(objSolid);
				instance_activate_object(objTopSolid);
				instance_activate_object(prtMovingPlatformSolid);
				instance_activate_object(prtMovingPlatformJumpthrough);
				
				with prtPlayer {
					
					if !canHit
						canHit = true;
					
					if instance_place(x, y+1, objSolid) || instance_place(x, y+1, objTopSolid) || instance_place(x, y+1, prtMovingPlatformSolid) || instance_place(x, y+1, prtMovingPlatformJumpthrough) {
						global.yspeed = 0;
						ground = true;
						stopSFX(sfxLand);
						sprite_index = spriteStand;
						image_speed = speedStand;
					}
				}
				
	            if returnBGM > -1 {
	                playMusicVolume(returnBGM, 0.9);
	            }
	        }
	    }
	}
}

