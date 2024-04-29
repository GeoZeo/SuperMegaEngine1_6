/// @description playMusic([filename], [volume], [loop start], [loop end])
function playMusic() {
	//Plays music
	//Calling this script while passing a filename argument results in the BGM changing
	//Example: playMusic("CutMan.ogg", 0.6, 0.4, 0.8)
	//Otherwise, it plays the BGM that was originally supposed to play
	//The script used to play it is determined by the arguments passed as the volume and loop points, if any
	
	var _new_bgm = argument[0];
	var _new_volume = argument[1];
	var _new_loop_start = argument[2];
	var _new_loop_end = argument[3];
	
	if _new_loop_end >= 1
		_new_loop_end = 1;
	
	if (!is_string(_new_bgm) and _new_bgm > -1) || (is_string(_new_bgm) and _new_bgm != noone) {
		
		if _new_volume > -1 && ((_new_loop_start > 0 and _new_loop_start < 1) or (_new_loop_end > 0 and _new_loop_end < 1)) && (_new_loop_start > -1 and _new_loop_end > -1) {
				
			playMusicVolumeLoopPoint(_new_bgm, _new_volume, _new_loop_start, _new_loop_end);
		}
		else if _new_volume > -1 && (_new_loop_start == 0 && _new_loop_end >= 1) {
			
			playMusicVolume(_new_bgm, _new_volume);
		}
		else if _new_volume > -1 {
				
			playMusicNoLoopVolume(_new_bgm, _new_volume);
		}
		else if ((_new_loop_start > 0 and _new_loop_start < 1) or (_new_loop_end > 0 and _new_loop_end < 1)) && (_new_loop_start > -1 and _new_loop_end > -1) {
			
			playMusicLoopPoint(_new_bgm, _new_loop_start, _new_loop_end);
		}
		else if (_new_loop_start == 0 && _new_loop_end >= 1) {
			
			playMusicDefault(_new_bgm);
		}
		else {
			
			playMusicNoLoop(_new_bgm);
		}
		
		exit;
	}
	else if instance_exists(prtPlayer) {
		
		with prtPlayer {
			
			if (!is_string(bgm) and bgm > -1) || (is_string(bgm) and bgm != noone) {
			
				if bgmVolume > -1 && bgmLength > -1 && ((bgmLoopStart > 0 and bgmLoopStart < bgmLength) or (bgmLoopEnd > 0 and bgmLoopEnd < bgmLength)) && (bgmLoopStart > -1 and bgmLoopEnd > -1) {
				
					playMusicVolumeLoopPoint(bgm, bgmVolume, bgmLoopStart / bgmLength, bgmLoopEnd / bgmLength);
				}
				else if bgmVolume > -1 && bgmLength > -1 && (bgmLoopStart == 0 && bgmLoopEnd >= bgmLength) {
			
					playMusicVolume(bgm, bgmVolume);
				}
				else if bgmVolume > -1 {
				
					playMusicNoLoopVolume(bgm, bgmVolume);
				}
				else if bgmLength > -1 && ((bgmLoopStart > 0 and bgmLoopStart < bgmLength) or (bgmLoopEnd > 0 and bgmLoopEnd < bgmLength)) && (bgmLoopStart > -1 and bgmLoopEnd > -1) {
			
					playMusicLoopPoint(bgm, bgmLoopStart / bgmLength, bgmLoopEnd / bgmLength);
				}
				else if bgmLength > -1 && (bgmLoopStart == 0 && bgmLoopEnd >= bgmLength) {
			
					playMusicDefault(bgm);
				}
				else {
			
					playMusicNoLoop(bgm);
				}
			}
			else {
		
				playNoMusic();
			}
		}
	}
	else {
		
		playNoMusic();
	}
	
	
	
}
