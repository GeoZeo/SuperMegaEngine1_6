//Create necessary objects
if !instance_exists(objGlobalControl)
    instance_create(x, y, objGlobalControl);
    
if !instance_exists(objHealthWeaponBar)
    instance_create(x, y, objHealthWeaponBar);
    
if !instance_exists(objFadeIn)
    instance_create(x, y, objFadeIn);
    
//map_surf = drawMap(room, 1/48, x, y);

playerCameraInit();
//if sectionRight - global.viewWidth != sectionLeft
//&& ((global.viewX >= sectionRight - global.viewWidth and x <= round(global.viewWidth - global.viewX) / 2)
//or (global.viewX <= sectionLeft and x >= round(global.viewWidth - global.viewX) / 2))
//{
//	cameraXOffset = round(x - (global.viewWidth - global.viewX) / 2) - (round(image_xscale) * !climbing);
//	print(cameraXOffset);
//}

if instance_exists(objMusicPlayer)
{
	with objMusicPlayer
	{
		playNoMusic();
	}
	with instance_nearest(x, y, objMusicPlayer) event_user(0);
}
else
{
	playNoMusic();
}

bgm = global.bgmIndex;
bgmLoopStart = global.loopStart;
bgmLoopEnd = global.loopEnd;
bgmVolume = global.volume;
bgmLength = global.length;

//Play starting jingle
if (!is_string(jingle) and jingle > -1) || (is_string(jingle) and jingle != noone)
	playSFX(jingle);
	
//Moves MM's x-position to the correct pixel in the middle of the screen, as in the games.
x -= cfgPushStartingPosBack;

