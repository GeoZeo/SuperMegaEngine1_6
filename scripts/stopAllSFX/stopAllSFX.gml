/// @description stopAllSFX()
function stopAllSFX() {
	//Stops all SFX

	if audio_system() == audio_old_system {
	    sound_stop_all();
	}
	else {
	    audio_stop_all();
	}
	global.bgm = -1;
	global.bgmIndex = -1;
    global.loopStart = -1;
    global.loopEnd = -1;
	global.volume = -1;
	global.length = -1;



}
