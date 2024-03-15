/// @description  onCharging
event_inherited();
if !instance_exists(objPharaohShotCharging) {
    initChargeTimer++;
    if initChargeTimer >= initChargeTime {
        instance_create(prtPlayer.x + prtPlayer.image_xscale, prtPlayer.y - 20, objPharaohShotCharging);
        initChargeTimer = 0;
        chargeTimer = 1;
    }
}

