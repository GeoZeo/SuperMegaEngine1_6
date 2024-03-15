/// @description  onReleaseCharge
event_inherited();

if (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) && chargeTimer != 0 {
  
	if (prtPlayer.canMove || prtPlayer.climbing) && !instance_exists(objSectionSwitcher) {
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

