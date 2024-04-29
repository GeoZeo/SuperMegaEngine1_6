/// @description stopSFX(index)
function stopSFX(argument0) {
	//Stops a sound effect

	if audio_system() == audio_old_system {
	    sound_stop(argument0);
	}
	else {
		if is_string(argument0) {   //For retro compatibility
		    var parts = split(argument0, ".");
		    var name = ds_queue_dequeue(parts);
		    var sound = asset_get_index("sfx" + name);
		    
			audio_stop_sound(sound);
		}
		else {
		    audio_stop_sound(argument0);
		}
	}
	


}
