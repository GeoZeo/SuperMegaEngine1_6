/// @description  nullifyDeath(): nullifies effects of death and starts a new phase
/// @param  refillHealthBar: whether we refill the health bar (for phase changes) or not (for death animations)
function nullifyDeath(argument0) {

	var refillHealthBar = argument0;
	
	if refillHealthBar {
		control = instance_nearest(x, y, objBossControl);
		control.canFillHealthBar = true;
	}
	
	if !object_is_ancestor(object_index, prtMiniBoss) global.bossHealth = 0;
	healthpoints = 0;
	dead = false;
	canInitDeath = false;
	if (!prtPlayer.locked && !object_is_ancestor(object_index, prtMiniBoss)) playerLockMovement();
	with prtEnemyProjectile {
	    instance_destroy();
	}
	if !object_is_ancestor(object_index, prtMiniBoss) {
		with prtPlayerProjectile {
		    instance_destroy();
		}
	}



}
