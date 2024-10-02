event_inherited();

if (instance_exists(objPharaohShotCharging) or (instance_exists(objPharaohShotCharged) and !objPharaohShotCharged.thrown)) && global.keyShoot && !prtPlayer.teleporting && !prtPlayer.showReady && (!global.frozen and instance_exists(prtPlayer) and !prtPlayer.locked and (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) and prtPlayer.canShoot and !prtPlayer.isSlide and (prtPlayer.canMove or prtPlayer.climbing)) {
	initChargeTimer = 0;
	chargeTimer = 1;
}

