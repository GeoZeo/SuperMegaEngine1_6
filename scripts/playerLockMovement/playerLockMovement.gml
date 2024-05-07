/// @description playerLockMovement([removeChargeOverride])
function playerLockMovement() {
	//Locks the player's movement

	//removeChargeOverride will override cfgLoseChargeOnLock, so if the latter is false, then the former being true means we lose charge,
	//and if the latter is true, then the former being false means we don't lose charge.
	var removeChargeOverride = false;
	if argument_count == 1
		removeChargeOverride = argument[0];
	else
		removeChargeOverride = cfgLoseChargeOnLock;

	with prtPlayer {
		locked = true;
		
		if (((cfgLoseChargeOnLock and !removeChargeOverride) or (!cfgLoseChargeOnLock and removeChargeOverride)
		or (cfgLoseChargeOnLock and removeChargeOverride)) || instance_exists(objBossDeathTimer))
		{
			global.weapons[global.currentWeapon].initChargeTimer = 0;
			global.weapons[global.currentWeapon].chargeTimer = 0;
			global.weapons[global.currentWeapon].chargeAnimTimer = 0;
			
			global.primaryCol = global.weapons[global.currentWeapon].primaryCol;
            global.secondaryCol = global.weapons[global.currentWeapon].secondaryCol;
            global.outlineCol = c_black;
			
			with weapons[global.currentWeapon] sound_stop(chargeSFX);
			with weapons[global.currentWeapon] sound_stop(chargedSFX);
			playChargeSound = true;
			playChargedSound = true;
			
			if instance_exists(objBossDeathTimer) && cfgLockSwitchingOnBossDeath {
				with prtPlayer canSwitch = false;
			}
		}
		
	    isStep = false;
		stepTimer = 0;
		stepForce = 0;
	    climbing = false;
	    canGravity = true;
		canSwitch = false;
	    isShoot = false;
	    isThrow = false;
	    canMove = false;
	    canSpriteChange = true;
	    isSlide = false;
	    canPause = false;
	    onRushJet = false;
	    mask_index = mskMegaman;
	    global.xspeed = 0;
		
		if !instance_exists(objBossDeathTimer) {
			if !instance_exists(objTeleport) {
				global.yspeed = 0;
			}
			else {
				var _zero = true;
				with objTeleport {
					if on
						_zero = false;
					if (global.yspeed < 0 && (alarm[3] != -1 or !playerLocked)) || sprite_index == prtPlayer.spriteTeleport {
						global.yspeed = 0;
						break;
					}
				}
			}
		}
		else if global.yspeed < 0
			global.yspeed = 0;
	}



}
