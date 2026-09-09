instance_destroy();

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

if teleport {
	var myTeleport = instance_create(mask_get_xcenter_object(other), mask_get_ycenter_object(other), objTeleport);
	myTeleport.fromItem = true;
	myTeleport.toX = toX;
	myTeleport.toY = toY;
	myTeleport.drawLED = false;
	myTeleport.image_xscale = 1/16;
	myTeleport.image_yscale = 1/16;
}

if fromStageEddie {
	var _oldActive = instance_exists(objEddie);
	if !_oldActive instance_activate_object(objEddie);
	if instance_exists(id_of_origin) {
		with id_of_origin {
			itemCollected = true;
			myItem = -1;
		}
	}
	if !_oldActive instance_deactivate_object(objEddie);
}