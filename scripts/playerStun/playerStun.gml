/// @description playerStun(stunTime)
function playerStun(argument0) {
	//Call it like this: with prtPlayer playerStun();
	//Stuns the player
	assert(argument0 >= 0, "playerStun: Stun time must be non-negative")
    
	if !isHit && !isStun && (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) {
		stunTimer = argument0 + extraStunFrames;
		isStun = true;
		isStep = false;
		stepTimer = 0;
		cancelStep = false;
		climbing = false;
		canGravity = true;
		isShoot = false;
		isThrow = false;
		onRushJet = false;
    
		if cfgLoseChargeOnStun {
		    weapons[global.currentWeapon].chargeTimer = 0;
		    weapons[global.currentWeapon].initChargeTimer = 0;
			weapons[global.currentWeapon].chargeAnimTimer = 0;
			with weapons[global.currentWeapon] stopSFX(chargeSFX);
			with weapons[global.currentWeapon] stopSFX(chargedSFX);
			prtPlayer.playChargeSound = true;
			prtPlayer.playChargedSound = true;
		    with prtPlayer event_user(0); //Reset the colors
		}
    
		//When sliding and there's a solid above us, we should not experience knockback
		//If we did, we would clip inside the ceiling above us
		if !locked && !(isSlide && (place_meeting(x, y-7, objSolid) || place_meeting(x, y-7, prtMovingPlatformSolid))) {
		    canMove = false;
		    canSpriteChange = false;
		    isSlide = false;
		    mask_index = mskMegamanSlide;
			
			global.xspeed = 0;
			global.yspeed = 0;
        
		    sprite_index = spriteStun;
			image_speed = speedStun;
		}
	}
	
	
	
}
