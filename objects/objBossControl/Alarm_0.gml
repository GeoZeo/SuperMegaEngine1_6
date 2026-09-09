/// @description  Spawn the death timer (if there is no boss to fight).
with prtPlayerProjectile {
	if object_index != objChargeKick {
		instance_destroy();
	}
}

var myTimer = instance_create(prtPlayer.x, prtPlayer.y, objBossDeathTimer);
myTimer.noBoss = true;
with myTimer event_user(0);

