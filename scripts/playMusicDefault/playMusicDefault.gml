/// @description playMusicDefault(filename)
function playMusicDefault(argument0) {
	//Plays music 100% as is, looping normally, and at its default volume
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
		global.length = audio_sound_length(snd);
		global.bgm = snd;
		global.loopStart = 0;
		global.loopEnd = global.length + 0.1;
	}
	if instance_exists(prtPlayer)
	&& ((!is_string(prtPlayer.jingle) and prtPlayer.jingle > -1)
	|| (is_string(prtPlayer.jingle) and prtPlayer.jingle != noone)) {
		stopSFX(global.bgm);
	}
	
	

}
