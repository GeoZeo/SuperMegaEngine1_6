/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

ammo += consumption;    //Return amount decreased by parent

if instance_number(objRushJet) < 1 {
    attackID = instance_create(prtPlayer.x + prtPlayer.image_xscale * 26, sprite_get_ycenter_object(prtPlayer) - 8, objRushJet);
    attackID.image_xscale = prtPlayer.image_xscale;
    prtPlayer.isShoot = false;
}
else {
    with objMegaBusterWeapon event_user(1);
}

