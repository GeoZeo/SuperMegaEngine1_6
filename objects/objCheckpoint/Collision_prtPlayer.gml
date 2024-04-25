instance_destroy();
global.checkpoint = true;
global.checkpointX = xx;
global.checkpointY = yy;

var myMusicPlayer = instance_place(x, y, objMusicPlayer)
if myMusicPlayer >= 0
{
	with myMusicPlayer
	{
		if insideView_Spr()
		{
			global.checkpointBGM = myBGM;
			global.checkpointBGMVolume = myVolume;
			global.checkpointBGMLoopStart = myLoopStart;
			global.checkpointBGMLoopEnd = myLoopEnd;
			playMusic(myBGM, myVolume, myLoopStart, myLoopEnd);
			instance_destroy();
		}
	}
}

