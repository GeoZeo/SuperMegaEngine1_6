if (!restartTimer)
{
	instance_destroy();
	
	if teleport
	{
		if (instance_exists(prtPlayer))
		{
			var myTeleport = instance_create(prtPlayer.x, prtPlayer.y, objTeleport);
			myTeleport.toX = toX;
			myTeleport.toY = toY;
			myTeleport.drawLED = false;
			myTeleport.image_xscale = 1/16;
			myTeleport.image_yscale = 1/16;
		}
	}
}
else
{
	restartTimer = false;
	alarm[0] = 105 * 2;
	alarm[1] = 0;
	if (flash and !visible) visible = true;
	flash = false;
}

