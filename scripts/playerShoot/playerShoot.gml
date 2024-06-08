/// @description playerShoot()
function playerShoot() {
	//Handles Mega Man's shooting

	if !instance_exists(objSectionSwitcher)
	{
		var box, yy, attackID;
		if image_xscale == 1
		    box = bbox_right + shoot_shift;
		else
		    box = bbox_left - shoot_shift;
    
		switch sprite_index
		{
		    case spriteStand: yy = y+shoot_height; break;
		    case spriteStep: yy = y+shoot_height; break;
		    case spriteWalk: yy = y+shoot_height; break;
		    case spriteJump: yy = y+jump_shoot_height; break;
		    case spriteClimb: yy = y+shoot_height; break;
		    default: yy = y+shoot_height; break;
		}


		//Shooting
		if global.keyShootPressed && canShoot && (canMove || climbing || (isThrow and room != rmWeaponGet) || onRushJet)
		&& instance_number(objBusterShotCharged) < 1 && global.ammo[global.currentWeapon] > 0
		{   
		    if climbing {
		        image_xscale = climbShootXscale;
        
		        if image_xscale == 1
		            box = bbox_right;
		        else
		            box = bbox_left;
		    }
    
			//To allow shooting in the opposite direction
			if global.keyShootPressed || (global.keyShoot && global.weapons[global.currentWeapon].rapidFire) {
				if global.keyRight && !global.keyLeft {
				    image_xscale = 1;
					if canInitStep && !canTurnaroundStep {
						if image_xscale != prevXScale {
							if !global.weapons[global.currentWeapon].freeShot {
								x = round(x) + -image_xscale*2;
							}
						}
					}
				}
				else if global.keyLeft && !global.keyRight {
				    image_xscale = -1;
					if canInitStep && !canTurnaroundStep {
						if image_xscale != prevXScale {
							if !global.weapons[global.currentWeapon].freeShot {
								x = round(x) + -image_xscale*2;
							}
						}
					}
				}
			}
			
			if image_xscale == 1
		        box = bbox_right;
		    else
		        box = bbox_left;
	
		    with global.weapons[global.weapon] {
		        print("Trying to use " + name + " with " + string(ammo) + " ammo");
		        event_user(1);
		    }
    
		}


		//While shooting
		if isShoot {
		    isThrow = false;
		
			if !global.weapons[global.currentWeapon].freeShot {
			
				//To allow shooting in the opposite direction
			    if global.keyShoot && global.weapons[global.currentWeapon].rapidFire {
			        if global.keyRight && !global.keyLeft {
			            image_xscale = 1;
						if canInitStep && !canTurnaroundStep {
							if image_xscale != prevXScale {
								x = round(x) + -image_xscale*2;
							}
						}
					}
			        else if global.keyLeft && !global.keyRight {
			            image_xscale = -1;
						if canInitStep && !canTurnaroundStep {
							if image_xscale != prevXScale {
								x = round(x) + -image_xscale*2;
							}
						}
					}
			    }
			
				if ground /*&& shootTimer == 0 */&& !climbing { //Only do this on the ground on the first frame
			        canWalk = false;
			        
					if !place_meeting(x, y+1, objIce)
						global.xspeed = 0;
					
			        canSpriteChange = false;
			        playerHandleSprites(); //We need to call this script because between shooting and checking shooting, it isn't executed and the wrong sprite would display
			        sprite_index = spriteStand;
					image_speed = speedStand;
			        if shootTimer == 0
						shootTimer = 5; //20 frames is too much to be frozen for. However, when not frozen, 20 frames looks better
			    }
			
				if !ground && !climbing {
			        canWalk = true;
			        canSpriteChange = true;
			    }
			}
		
		    shootTimer++;
		    if shootTimer >= 20 {
		        isShoot = false;
				if ground {
			        canWalk = true;
			        canSpriteChange = true;
			    }
		    }
		}
		else if isThrow { //Throwing weapons, like Pharaoh Shot and Metal Blade
		    isShoot = false;
    
			if !global.weapons[global.currentWeapon].freeShot {
			
				//To allow shooting in the opposite direction
			    if global.keyShoot && global.weapons[global.currentWeapon].rapidFire {
			        if global.keyRight && !global.keyLeft {
			            image_xscale = 1;
						if canInitStep && !canTurnaroundStep {
							if image_xscale != prevXScale {
								x = round(x) + -image_xscale*2;
							}
						}
					}
			        else if global.keyLeft && !global.keyRight {
			            image_xscale = -1;
						if canInitStep && !canTurnaroundStep {
							if image_xscale != prevXScale {
								x = round(x) + -image_xscale*2;
							}
						}
					}
			    }
			
				if ground /*&& shootTimer == 0 */&& !climbing { //Only do this on the ground on the first frame
			        canWalk = false;
					
					if !place_meeting(x, y+1, objIce)
						global.xspeed = 0;
					
			        canSpriteChange = false;
			        playerHandleSprites(); //We need to call this script because between throwing and checking throwing, it isn't executed and the wrong sprite would display
			        sprite_index = spriteStand;
					image_speed = speedStand;
			        if shootTimer == 0
						shootTimer = 5; //20 frames is too much to be frozen for. However, when not frozen, 20 frames looks better
			    }
			
				if !ground && !climbing {
			        canWalk = true;
			        canSpriteChange = true;
			    }
			}
    
		    shootTimer++;
		    if shootTimer >= 20 {
		        isThrow = false;
			    if ground {
			        canWalk = true;
			        canSpriteChange = true;
			    }
		    }
		}

		instance_activate_object(prtWeapon);
	}

	//Charging weapons
	if global.weapons[global.currentWeapon].ammo > 0 and room != rmWeaponGet {
	    if (((!locked and !instance_exists(objSectionSwitcher)) and global.keyShoot) or (((locked and !instance_exists(objBossDeathTimer)) or instance_exists(objSectionSwitcher)) and (cfgContinueChargeAnimWhileLocked or cfgChargeWhileLocked or (instance_exists(objArenaStartingPoint) and objArenaStartingPoint.isMM))))
		|| (isSlide && global.weapons[global.currentWeapon].chargeTimer != 0) {    // Pressing shoot key
	        with global.weapons[global.currentWeapon] event_user(3);
	    }
	    if !global.keyShoot && global.weapons[global.currentWeapon].chargeTimer != 0 {  // Shoot key released
	        with global.weapons[global.currentWeapon] event_user(4);
	    }
	}



}
