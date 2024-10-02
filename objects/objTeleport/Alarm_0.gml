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
		//if sectionRight - global.viewWidth != sectionLeft
		//&& ((global.viewX >= sectionRight - global.viewWidth and x <= round(global.viewWidth - global.viewX) / 2)
		//or (global.viewX <= sectionLeft and x >= round(global.viewWidth - global.viewX) / 2))
		//{
		//	cameraXOffset = round(x - (global.viewWidth - global.viewX) / 2) - (round(image_xscale) * !climbing);
		//	print(cameraXOffset);
		//}
	}

	x = toX - (cfgPushStartingPosBack * toDir);
	y = toY;

	show_debug_message("Teleport to (" + string(toX - 1) + "," + string(toY) + ") now!");
}

with objMegamanExplosion instance_destroy();

