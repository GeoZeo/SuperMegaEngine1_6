/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

var _refs = 0;
with objReflectedProjectile {
	if id_of_origin == prtPlayer _refs++;
}

if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) + _refs < maxshots {

    attackID = instance_create(box + prtPlayer.image_xscale * 4, yy, objBusterShot);

}