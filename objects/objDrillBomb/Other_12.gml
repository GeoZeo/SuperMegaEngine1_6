/// @description  Explode

if !global.frozen {
    instance_create(x, y, objDrillBombExplosion);
	stopSFX(global.weapons[global.currentWeapon].sfx);
	event_user(15);
    instance_destroy();
}

