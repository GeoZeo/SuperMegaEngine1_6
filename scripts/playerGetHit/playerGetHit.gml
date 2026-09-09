/// @description playerGetHit(health, bypassImmunityChecks)
function playerGetHit(argument0, argument1) {
	//Call it like this: with prtPlayer playerGetHit();
	//Makes the player get hit
	assert(argument0 >= 0, "playerGetHit: Damage must be non-negative");
	assert(argument1 == 0 or argument1 == 1, "playerGetHit: Value for bypassing immunity checks must be boolean");
	
	var _isImmune = instance_exists(objChargeKick); //Add additional immunity checks as they come

	if canHit && (!_isImmune or argument1) {
	    if argument0 != 0 drawDamageNumber(prtPlayer.x, prtPlayer.y, ceil(argument0 * damageMultiplier * global.damageMultiplier));
	    global._health -= ceil(argument0 * damageMultiplier * global.damageMultiplier);
    
	    canHit = false;
	    isHit = true;
		hitTimer = 0;
	    isStep = false;
		stepTimer = 0;
		cancelStep = false;
	    climbing = false;
	    canGravity = true;
	    isShoot = false;
	    isThrow = false;
	    onRushJet = false;
    
	    if cfgLoseChargeOnHit {
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
	    if !superArmour && !locked && !((isSlide or isStun) && (place_meeting(x, y-(7+(2*isDash)), objSolid) || place_meeting(x, y-(7+(2*isDash)), prtMovingPlatformSolid))) {
	        canMove = false;
	        canSpriteChange = false;
	        isSlide = false;
			isDash = false;
			isStun = false;
			stunTimer = 0;
			flying = false;
			rollbackMovement = false;
	        mask_index = mskMegaman;
			
			if global._health > 0 {
				
		        if knockbackAmount != 0
				{
					var _total_xspeed = global.xspeed + global.xforce;
					var _total_yspeed = global.yspeed + global.yforce;
					
					var _xc;
					if image_xscale < 0 { _xc = clamp(abs(_total_xspeed), 0.5, 1); }
					else { _xc = clamp(abs(_total_xspeed), 0.500005, 1); }
			
					if (image_xscale >= 0 and !(bbox_left+_total_xspeed-_xc < sectionLeft or bbox_left+_total_xspeed-_xc < 0))
					|| (image_xscale < 0 and !(bbox_right+_total_xspeed+_xc > sectionRight or bbox_right+_total_xspeed+_xc > room_width))
					{
				        if !place_meeting(x-(_xc * image_xscale), y, objSolid) && !place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid)
				            global.xspeed = image_xscale * -knockbackAmount;
				        else if place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
				        {
				            if instance_place(x-(_xc * image_xscale), y, prtMovingPlatformSolid).dead == true
				                global.xspeed = image_xscale * -knockbackAmount;
				        }
					}
				}
				else
				{
					//If we don't have any knockback, we just get hitstunned. Enabling super armour is how we remove both hitstun and knockback.
					if !place_meeting(x, y+1, objIce)
						global.xspeed = 0;
				}
				
		        global.yspeed = 0;
        
	            sprite_index = spriteHit;
				image_speed = speedHit;
            
	            //Create sweat effects
	            instance_create(sprite_get_xcenter()-11, sprite_get_ycenter()-17, objMegamanSweat);
	            instance_create(sprite_get_xcenter(), sprite_get_ycenter()-17, objMegamanSweat);
	            instance_create(sprite_get_xcenter()+11, sprite_get_ycenter()-17, objMegamanSweat);
	        }
	    }
    
	    if global._health > 0 {
	        playSFX(sfxHit);
	    }
	}



}
