/// @description Play music

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


