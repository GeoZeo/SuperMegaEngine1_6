//Create necessary objects
if !instance_exists(objGlobalControl)
    instance_create(x, y, objGlobalControl);
    
if !instance_exists(objHealthWeaponBar)
    instance_create(x, y, objHealthWeaponBar);
    
if !instance_exists(objFadeIn)
    instance_create(x, y, objFadeIn);
    
//map_surf = drawMap(room, 1/48, x, y);

playerCameraInit();

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

objBeatEquip.count = 3;

//Play starting jingle
if (!is_string(jingle) and jingle > -1) || (is_string(jingle) and jingle != noone)
	playSFX(jingle);

