timerLED += 0.1;
if timerLED >= 2 {
    timerLED = 0;
}

if on && createScenery {
	instance_create(x-16, y-32, objMM3Teleporter);	
	createScenery = false;
}

if (instance_exists(prtPlayer) && (!prtPlayer.showReady and !prtPlayer.teleporting)) {
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
		                if !insideView() or (bossID > -1 and global.bossRushDefeated[bossID]) {
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
						
					global.yspeed = 0;
					stopSFX(sfxLand);
					
					if place_meeting(x, y+1, objSolid)
					|| (place_meeting(x, y+1, objTopSolid) && bbox_bottom <= instance_place(x, y+1, objTopSolid).bbox_top+1)
					|| (place_meeting(x, y+1, prtMovingPlatformSolid) and !instance_place(x, y+1, prtMovingPlatformSolid).dead)
					|| ((place_meeting(x, y+1, prtMovingPlatformJumpthrough) && bbox_bottom <= instance_place(x, y+1, prtMovingPlatformJumpthrough).bbox_top+1) and !instance_place(x, y+1, prtMovingPlatformJumpthrough).dead) {
						
						ground = true;
						sprite_index = spriteStand;
						image_speed = speedStand;
						
					}
					
					if other.water
						inWater = true;
				}
				
				if image_xscale != 1
					image_xscale = 1;
				if image_yscale != 1
					image_yscale = 1;
				
	        }
	    }
	}
	
	prevPlayerX = prtPlayer.x;
	prevMaskX = mask_get_xcenter_object(prtPlayer);
	
	if prtPlayer.ground && playerLocked {
		if warpTime > 0 {
			alarm[3] = warpTime;
			playerLocked = false;
		}
		else {
			playerLocked = false;
			x = prtPlayer.x;
			y = prtPlayer.y;
			on = true;
		}
	}
}

