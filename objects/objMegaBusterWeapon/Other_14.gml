/// @description  onReleaseCharge
event_inherited();

if (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) && (chargeTimer != 0 or initChargeTimer != 0) {
  
	if chargeTimer != 0 {
		var _chargeShotsReflected = 0;
		with objReflectedProjectile
		{
			if id_of_origin == prtPlayer 
			&& string_contains(sprite_get_name(sprite_index), "Buster")
			&& string_ends_with(sprite_get_name(sprite_index), "Charged") && !string_ends_with(sprite_get_name(sprite_index), "HalfCharged") 
				_chargeShotsReflected++;
		}
  
		if (prtPlayer.canMove || prtPlayer.climbing) && !instance_exists(objSectionSwitcher)
		&& instance_number(objBusterShotCharged) + _chargeShotsReflected < 1 {
			prtPlayer.isShoot = true;
		    prtPlayer.shootTimer = 0;

		    if chargeTimer < chargeTime {
		        attackID = instance_create(box + prtPlayer.image_xscale * 6, yy, objBusterShotHalfCharged);
		        playSFX(sfxBusterHalfCharged);
		    }
		    else {
		        attackID = instance_create(box + prtPlayer.image_xscale * 14, yy, objBusterShotCharged);
		        playSFX(sfxBusterCharged);
		    }
		}
	}
    
	if ((prtPlayer.canMove or prtPlayer.climbing) || (prtPlayer.locked and cfgChargeWhileLocked))
	&& (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) {
		chargeTimer = 0;
	    initChargeTimer = 0;
		chargeAnimTimer = 0;
	    stopSFX(chargedSFX);
	    stopSFX(chargeSFX);
	    with prtPlayer {
			playChargeSound = true;
			playChargedSound = true;
			event_user(0); //Reset the colors
		}
	}
}

