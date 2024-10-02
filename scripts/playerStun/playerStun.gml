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
    
		if !locked {
		    canMove = false;
		    canSpriteChange = false;
		    isSlide = false;
		    mask_index = mskMegamanSlide;
			
			//To make sure we don't get crushed if we're stunned while close to a wall
			var endLoop, attempts;
	        endLoop = false;
			attempts = 0;
			var orig_x = x;
	        while (place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)) && endLoop == false && attempts < abs(round((sprite_get_width(mask_index) * image_xscale) / 2))
	        {
	            if !place_meeting(x, y, objSolid) && place_meeting(x, y, prtMovingPlatformSolid)
	            {
	                if instance_place(x, y, prtMovingPlatformSolid).dead == true
	                    endLoop = true;
	            }
				
				var mySolid = instance_place(x, y, objSolid);
				if mySolid < 0
				{
					if instance_place(x, y, prtMovingPlatformSolid).dead == false
						mySolid = instance_place(x, y, prtMovingPlatformSolid);
				}
                
	            if mySolid >= 0
					x += sign(x - mySolid.x);
				attempts++;
	        }
			if (place_meeting(x, y, objSolid) || (place_meeting(x, y, prtMovingPlatformSolid) and !instance_place(x, y, prtMovingPlatformSolid).dead)) && !endLoop
			{
				var mySolid = instance_place(x, y, objSolid);
				if mySolid < 0
				{
					if instance_place(x, y, prtMovingPlatformSolid).dead == false
						mySolid = instance_place(x, y, prtMovingPlatformSolid);
				}
                
	            if mySolid >= 0
					x = orig_x;
			}
			
			if !place_meeting(x, y+1, objIce)
				global.xspeed = 0;
			
			if global.yspeed < 0
				global.yspeed = 0;
        
		    sprite_index = spriteStun;
			image_speed = speedStun;
		}
	}
	
	
	
}
