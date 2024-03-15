/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

attackID = instance_create(box + prtPlayer.image_xscale * 8, yy + shot * 4 - 2, objNeedleCannon);
shot = 1 - shot;

