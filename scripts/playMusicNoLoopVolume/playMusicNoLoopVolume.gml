/// @description playMusicVolume(filename, volume)
function playMusicNoLoopVolume(argument0, argument1) {
	//Plays music without looping it and at a set volume. Volume should be between 0 and 1.
	//Example: playMusicNoLoopVolume("CutMan.ogg", 0.6)

	stopSFX(global.bgm);
	var snd = noone;
	if is_string(argument0) {   //For retro compatibility
	    var parts = split(argument0, ".");
	    var name = ds_queue_dequeue(parts);
	    var sound = asset_get_index("bgm" + name);
	    if !audio_is_playing(sound) {
	        snd = audio_play_sound(sound, 1, false);
	    }
		global.bgmIndex = sound;
	}
	else if !audio_is_playing(argument0) {
	    snd = audio_play_sound(argument0, 1, false);
		global.bgmIndex = argument0;
	}
	if snd != noone {
	    audio_sound_gain(snd, argument1, 0);
	    global.bgm = snd;
		global.volume = argument1;
	}
	if instance_exists(prtPlayer)
	&& ((!is_string(prtPlayer.jingle) and prtPlayer.jingle > -1)
	|| (is_string(prtPlayer.jingle) and prtPlayer.jingle != noone)) {
		stopSFX(global.bgm);
	}



}
