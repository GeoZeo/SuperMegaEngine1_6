/// @description playerPause()
function playerPause() {
	//Pauses the game when the pause button is pressed

	if global.keyPausePressed && canPause && instance_exists(prtPlayer) {
	    global.weapons[global.currentWeapon].initChargeTimer = 0;
	    global.weapons[global.currentWeapon].chargeTimer = 0;
		global.weapons[global.currentWeapon].chargeAnimTimer = 0;
		with weapons[global.currentWeapon] stopSFX(chargeSFX);
		with weapons[global.currentWeapon] stopSFX(chargedSFX);
		playChargeSound = true;
		playChargedSound = true;

	    global.frozen = true;
	    instance_create(x, y, objPauseMenu);
	    playSFX(sfxPause);
	}



}
