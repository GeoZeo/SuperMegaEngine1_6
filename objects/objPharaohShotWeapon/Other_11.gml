/// @description  onShoot
event_inherited();
if !ok return false;    //This line must be on every weapon

attackID = instance_create(box + prtPlayer.image_xscale * 4, yy, objPharaohShot);
    
if global.keyUp && !global.keyDown
    attackID.yspeed = -4.5;
else if global.keyDown && !global.keyUp
    attackID.yspeed = 4.5;
else
    attackID.yspeed = 0;

