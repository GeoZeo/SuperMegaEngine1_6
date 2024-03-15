/// @description  onShoot
event_inherited();
if !ok return false;    //This line should be on every weapon

attackID = instance_create(prtPlayer.x + prtPlayer.image_xscale * 3, yy, objMetalBlade);
    
if global.keyRight && !global.keyLeft && global.keyUp
    attackID.dir = 45;
else if global.keyLeft && !global.keyRight && global.keyUp
    attackID.dir = 135;
else if global.keyLeft && !global.keyRight && global.keyDown
    attackID.dir = 225;
else if global.keyRight && !global.keyLeft && global.keyDown
    attackID.dir = 315;
else if global.keyUp
    attackID.dir = 90;
else if global.keyDown
    attackID.dir = 270;
else
{
    if prtPlayer.image_xscale == -1
        attackID.dir = 180;
    else
        attackID.dir = 0;
}

