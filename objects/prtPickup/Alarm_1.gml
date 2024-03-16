if (!restartTimer)
{
	instance_destroy();
	
	if createTeleport
	{
		if (instance_exists(prtPlayer))
		{
			var myTeleport = instance_create(prtPlayer.x, prtPlayer.y, objTeleport);
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

