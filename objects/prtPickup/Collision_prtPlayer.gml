instance_destroy();

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

if createTeleport
{
	var myTeleport = instance_create(x, y, objTeleport);
}