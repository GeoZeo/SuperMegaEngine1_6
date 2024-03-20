/// @description  nullifyDeath(): nullifies effects of death and starts a new phase
function nullifyDeath(argument0) {

	var refillHealthBar = argument0;
	
	if refillHealthBar {
		control = instance_nearest(x, y, objBossControl);
		control.canFillHealthBar = true;
	}
	
	global.bossHealth = 0;
	healthpoints = 0;
	dead = false;
	canInitDeath = false;
	if (!prtPlayer.locked)	playerLockMovement();
	with prtEnemyProjectile {
	    instance_destroy();
	}
	with prtPlayerProjectile {
	    instance_destroy();
	}



}
