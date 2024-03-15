/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

attackID = instance_create(prtPlayer.x, sprite_get_ycenter_object(prtPlayer), objCentaurFlash);

