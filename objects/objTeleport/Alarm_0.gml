/// @description  Go to destination

//Move camera to destination
if !prtPlayer.showReady && !prtPlayer.teleporting
{
	prtPlayer.x = toX - (cfgPushStartingPosBack * toDir);
	prtPlayer.y = toY;
	prtPlayer.newSectionXOffset = 0;
	prtPlayer.newSectionYOffset = 0;
	with prtPlayer 
	{
		playerCameraInit();
		cameraXOffset = 0.5;
		cameraYOffset = 0.5;
	}

	x = toX - (cfgPushStartingPosBack * toDir);
	y = toY;

	show_debug_message("Teleport to (" + string(toX - (cfgPushStartingPosBack * toDir)) + "," + string(toY) + ") now!");
}

with objMegamanExplosion instance_destroy();

