instance_destroy();

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

if teleport {
	var myTeleport = instance_create(other.x, other.y, objTeleport);
	myTeleport.toX = toX;
	myTeleport.toY = toY;
	myTeleport.returnBGM = teleportBGM;
}