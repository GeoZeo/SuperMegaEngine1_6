/// @description playNoMusic()
function playNoMusic() {
	//Removes current music and plays absolutely no music whatsoever.
	//Put this in level creation code if you don't want any music for a room and need to remove the music from the previous room.
	
	stopSFX(global.bgm);
	global.bgm = -1;
	global.bgmIndex = -1;
	global.loopStart = -1;
	global.loopEnd = -1;
	global.volume = -1;
	global.length = -1;

	if instance_exists(prtPlayer)
	{
		with prtPlayer
		{
			bgm = noone;
			bgmVolume = -1;
			bgmLoopStart = -1;
			bgmLoopEnd = -1;
			bgmLength = -1;
		}
	}
	
	
	
}
