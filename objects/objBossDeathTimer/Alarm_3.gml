/// @description  Warp MM if necessary

var myTeleport = instance_create(other.x, other.y, objTeleport);
myTeleport.toX = control.toX;
myTeleport.toY = control.toY;
myTeleport.returnBGM = control.returnBGM;

