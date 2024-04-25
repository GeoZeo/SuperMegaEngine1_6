/// @description playMusicDefault(filename)
function playMusicDefault(argument0) {
	//Plays music 100% as is, without any looping or loop start/end points, and at its default volume
	//Example: playMusicDefault("CutMan.ogg")

	stopSFX(global.bgm);
	var snd = noone;
	if is_string(argument0) {   //For retro compatibility
	    var parts = split(argument0, ".");
	    var name = ds_queue_dequeue(parts);
	    var sound = asset_get_index("bgm" + name);
	    if !audio_is_playing(sound) {
	        snd = audio_play_sound(sound, 1, true);
	    }
		global.bgmIndex = sound;
	}
	else if !audio_is_playing(argument0) {
	    snd = audio_play_sound(argument0, 1, true);
		global.bgmIndex = argument0;
	}
	if snd != noone {
		global.bgm = snd;
	}
	if instance_exists(prtPlayer) && prtPlayer.jingle > -1 && room != rmWeaponGet {
		stopSFX(global.bgm);
	}
	
	

}
