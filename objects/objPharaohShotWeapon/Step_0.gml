event_inherited();

if (instance_exists(objPharaohShotCharging) or (instance_exists(objPharaohShotCharged) and !objPharaohShotCharged.thrown)) && global.keyShoot && (!global.frozen and instance_exists(prtPlayer) and (!instance_exists(objSectionSwitcher) or cfgChargeWhileLocked) and !prtPlayer.teleporting and !prtPlayer.showReady and prtPlayer.canShoot and !prtPlayer.isSlide and (prtPlayer.canMove or prtPlayer.climbing)) {
	initChargeTimer = 0;
	chargeTimer = 1;
}

