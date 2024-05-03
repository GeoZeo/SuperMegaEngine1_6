instance_destroy();

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

if teleport {
	var myTeleport = instance_create(mask_get_xcenter_object(other), mask_get_ycenter_object(other), objTeleport);
	myTeleport.toX = toX;
	myTeleport.toY = toY;
	myTeleport.drawLED = false;
	myTeleport.image_xscale = 1/16;
	myTeleport.image_yscale = 1/16;
}