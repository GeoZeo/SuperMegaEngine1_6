/// @description  onReleaseCharge
event_inherited();

if instance_exists(objPharaohShotCharging) {
    if (prtPlayer.canMove || prtPlayer.climbing) {
        initChargeTimer = 0;
        chargeTimer = 0;        
        if objPharaohShotCharging.sprite_index == sprPharaohShotCharging { //Small shot
            event_user(1);
        }
        else {  //Big shot
            attackID = instance_create(box + prtPlayer.image_xscale * 10, yy, objPharaohShotCharged);
                
            if global.keyUp && !global.keyDown
                attackID.yspeed = -4.5;
            else if global.keyDown && !global.keyUp
                attackID.yspeed = 4.5;
            else
                attackID.yspeed = 0;
                
            playSFX(sfxPharaohShotCharged);
            prtPlayer.isThrow = true;
            prtPlayer.shootTimer = 0;
            
        }
        
            ammo -= chargeConsumption;
            if ammo <= 0
                ammo = 0;
            with objPharaohShotCharging instance_destroy();
    }

}
else {
    initChargeTimer = 0;
    chargeTimer = 0;
}

