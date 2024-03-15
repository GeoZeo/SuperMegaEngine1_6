if (!restartTimer) { instance_destroy(); }
else
{
	restartTimer = false;
	alarm[0] = 105 * 2;
	alarm[1] = 0;
	if (flash and !visible) visible = true;
	flash = false;
}

