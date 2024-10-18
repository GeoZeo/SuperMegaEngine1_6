/// @description  onCharging
event_inherited();
if !instance_exists(objPharaohShotCharging) && (!instance_exists(objPharaohShotCharged) or objPharaohShotCharged.thrown)
&& !prtPlayer.teleporting && !prtPlayer.showReady {
    if (global.keyShoot && !(prtPlayer.locked and instance_exists(objBossDeathTimer))) || room == rmWeaponGet initChargeTimer++;
    if initChargeTimer >= initChargeTime {
        instance_create(prtPlayer.x + prtPlayer.image_xscale, prtPlayer.y - 20, objPharaohShotCharging);
        initChargeTimer = 0;
        chargeTimer = 1;
    }
}

