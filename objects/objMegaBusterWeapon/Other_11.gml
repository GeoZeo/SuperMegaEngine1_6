/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) + instance_number(objReflectedProjectile) < maxshots {

    attackID = instance_create(box + prtPlayer.image_xscale * 4, yy, objBusterShot);

}

chargeTimer = 0;
initChargeTimer = 0;
chargeAnimTimer = 0;