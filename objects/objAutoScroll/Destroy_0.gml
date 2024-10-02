if border > -1 with border instance_destroy();
if border2 > -1 with border2 instance_destroy();
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

