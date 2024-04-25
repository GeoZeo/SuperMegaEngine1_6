/// @description playMusicLoopPoint(filename, loop start, loop end)
function playMusicLoopPoint(argument0, argument1, argument2) {
	//Plays music and loops from one point to another point
	//loop start and loop end should be between 0 and 1 (0 being 0:00 and 1 being the end of the music)
	//Example: playMusicLoopPoint("CutMan.ogg", 0.4, 0.8)

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
	    global.length = audio_sound_length(snd);
	    global.loopStart = argument1 * global.length;
	    global.loopEnd = argument2 * global.length;
	    global.bgm = snd;
	}
	if instance_exists(prtPlayer) && prtPlayer.jingle > -1 && room != rmWeaponGet {
		stopSFX(global.bgm);
	}



}
