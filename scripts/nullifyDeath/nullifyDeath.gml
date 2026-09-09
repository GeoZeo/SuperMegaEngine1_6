/// @description  nullifyDeath(): nullifies effects of death and starts a new phase
/// @param  refillHealthBar: whether we refill the health bar (for phase changes) or not (for death animations)
/// @param  stopHitSFX: whether to stop playing sfxEnemyHit
function nullifyDeath(argument0, argument1) {

	var refillHealthBar = argument0;
	var stopHitSFX = argument1;
	
	if refillHealthBar {
		control = instance_nearest(x, y, objBossControl);
		control.canFillHealthBar = true;
	}
	
	if object_is_ancestor(object_index, prtBoss) global.bossHealth = 0;
	healthpoints = 0;
	dead = false;
	canInitDeath = false;
	if stopHitSFX stopSFX(sfxEnemyHit);
	if (!prtPlayer.locked && object_is_ancestor(object_index, prtBoss)) playerLockMovement();
	
	if object_is_ancestor(object_index, prtBoss) || object_is_ancestor(object_index, prtMiniBoss) {
		with prtEnemyProjectile {
		    instance_destroy();
		}
		with objReflectedProjectile {
			instance_destroy();
		}
	}
	if object_is_ancestor(object_index, prtBoss) {
		with prtPlayerProjectile {
		    instance_destroy();
		}
		with objDeflectedProjectile {
			instance_destroy();
		}
	}



}
