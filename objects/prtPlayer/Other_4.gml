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
	with instance_nearest(x, y, objMusicPlayer)
	{
		if canPlay
		{
			if (!is_string(myBGM) and myBGM > -1) || (is_string(myBGM) and myBGM != noone)
			{
				if is_string(myBGM)
				{   //For retro compatibility
				    var parts = split(myBGM, ".");
				    var name = ds_queue_dequeue(parts);
				    var sound = asset_get_index("bgm" + name);
				    if !audio_is_playing(sound)
					{
				        playMusic(sound, myVolume, myLoopStart, myLoopEnd);
				    }
				}
				else if !audio_is_playing(myBGM)
				{
				    playMusic(myBGM, myVolume, myLoopStart, myLoopEnd);
				}
			}
			else
			{
				playNoMusic();
			}
			
			canPlay = false;
			
			if destroyOnActivation
				instance_destroy();
		}
	}
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

