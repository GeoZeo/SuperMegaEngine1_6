if insideView_Spr() && instance_exists(prtPlayer) && !place_meeting(x, y, objCheckpoint) && !instance_exists(objSectionSwitcher)
{
	playMusic(myBGM, myVolume, myLoopStart, myLoopEnd);
	instance_destroy();
}

