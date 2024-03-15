/// @description  onShoot
event_inherited();
if !ok return false;    //This line must be on every weapon

attackID = instance_create(box + prtPlayer.image_xscale * 4, yy, objHornetChaser);

