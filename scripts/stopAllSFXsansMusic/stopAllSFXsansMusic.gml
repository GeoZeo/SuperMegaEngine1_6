/// @description stopAllSFXsansMusic()
function stopAllSFXsansMusic() {
	//Stops all SFX

	if audio_system() == audio_new_system {
	    for (var i = 0; audio_exists(i); i++) {
			if !string_starts_with(audio_get_name(i), "bgm") {
				audio_stop_sound(i);
			}
		}
	}
	else {
	    return false;
	}



}
