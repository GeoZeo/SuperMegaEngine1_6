/// @description  onShoot
event_inherited();
if !ok return false;    //This line must be on every weapon

ammo = old_ammo;    //Return amount decreased by parent

attackID = instance_create(prtPlayer.x, sprite_get_ycenter_object(prtPlayer), objStarCrash);

