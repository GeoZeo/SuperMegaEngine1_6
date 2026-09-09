/// @description  onReleaseCharge
event_inherited();

if (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) && (chargeTimer != 0 or initChargeTimer != 0) {
	
	if prtPlayer.canShoot {
		if chargeTimer != 0 {
			var _chargeShotsDeflected = 0;
			with objDeflectedProjectile
			{
				if id_of_origin == prtPlayer 
				&& string_contains(sprite_get_name(sprite_index), "Buster")
				&& string_ends_with(sprite_get_name(sprite_index), "Charged") && !string_ends_with(sprite_get_name(sprite_index), "HalfCharged") 
					_chargeShotsDeflected++;
			}
		
			var _halfChargeShotsDeflected = 0;
			with objDeflectedProjectile
			{
				if id_of_origin == prtPlayer 
				&& string_contains(sprite_get_name(sprite_index), "Buster")
				&& string_ends_with(sprite_get_name(sprite_index), "HalfCharged") 
					_halfChargeShotsDeflected++;
			}
		
			var _noChargeShotsDeflected = 0;
			with objDeflectedProjectile
			{
				if id_of_origin == prtPlayer 
				&& string_contains(sprite_get_name(sprite_index), "Buster")
				&& !string_ends_with(sprite_get_name(sprite_index), "Charged") && !string_ends_with(sprite_get_name(sprite_index), "HalfCharged")
					_halfChargeShotsDeflected++;
			}
	
			if (prtPlayer.canMove || prtPlayer.climbing) && !instance_exists(objSectionSwitcher)
			&& (instance_number(objProtoBusterShotCharged) + _chargeShotsDeflected) < 1 && (instance_number(objBusterShot) + instance_number(objProtoBusterShotHalfCharged) + _halfChargeShotsDeflected + _noChargeShotsDeflected) < maxshots {
			    prtPlayer.isShoot = true;
			    prtPlayer.shootTimer = 0;

			    if chargeTimer < chargeTime {
			        attackID = instance_create(box + prtPlayer.image_xscale * 6, yy, objProtoBusterShotHalfCharged);
			        playSFX(sfxBuster);
			    }
			    else {
			        attackID = instance_create(box + prtPlayer.image_xscale * 14, yy, objProtoBusterShotCharged);
			        playSFX(sfxProtoBusterCharged);
			    }
			}
		}
	}
    
	if ((prtPlayer.canMove or prtPlayer.climbing) || (prtPlayer.locked and cfgChargeWhileLocked))
	&& (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked)
	&& (prtPlayer.canShoot or (prtPlayer.locked and cfgChargeWhileLocked)) {
		chargeTimer = 0;
	    initChargeTimer = 0;
		chargeAnimTimer = 0;
	    stopSFX(chargeSFX);
	    with prtPlayer {
			playChargeSound = true;
			event_user(0); //Reset the colors
		}
	}
}

