instance_destroy();

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

if teleport {
	var myTeleport = instance_create(other.x, other.y, objTeleport);
	myTeleport.toX = toX;
	myTeleport.toY = toY;
	myTeleport.drawLED = false;
	myTeleport.image_xscale = 1/16;
	myTeleport.image_yscale = 1/16;
}