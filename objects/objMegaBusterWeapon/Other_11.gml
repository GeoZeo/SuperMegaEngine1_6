/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

var _defs = 0;
with objDeflectedProjectile {
	if id_of_origin == prtPlayer _defs++;
}

if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) + _defs < maxshots {

    attackID = instance_create(box + prtPlayer.image_xscale * 4, yy, objBusterShot);

}