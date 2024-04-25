/// @description playMusic([filename], [volume], [loop start], [loop end])
function playMusic() {
	//Plays music
	//Calling this script while passing a filename argument results in the BGM changing
	//Example: playMusic("CutMan.ogg", 0.6, 0.4, 0.8)
	//Otherwise, it plays the BGM that was originally supposed to play
	//The script used to play it is determined by whether or not volume and loop points are valid
	
	var _new_bgm = argument[0];
	var _new_volume = argument[1];
	var _new_loop_start = argument[2];
	var _new_loop_end = argument[3];
	
	if _new_bgm > -1 {
		
		if _new_volume > -1 && _new_loop_start > -1 && _new_loop_end > -1 {
				
			playMusicVolumeLoopPoint(_new_bgm, _new_volume, _new_loop_start, _new_loop_end);
			print("Music");
		}
		else if _new_volume > -1 {
				
			playMusicVolume(_new_bgm, _new_volume);
		}
		else if _new_loop_start > -1 && _new_loop_end > -1 {
			
			playMusicLoopPoint(_new_bgm, _new_loop_start, _new_loop_end);
		}
		else {
			
			playMusicDefault(_new_bgm);
		}
		
		exit;
	}
	else if instance_exists(prtPlayer) {
		
		with prtPlayer {
			
			if bgm > -1 {
			
				if bgmVolume > -1 && bgmLoopStart > -1 && bgmLoopEnd > -1 && bgmLength > -1 {
				
					playMusicVolumeLoopPoint(bgm, bgmVolume, bgmLoopStart / bgmLength, bgmLoopEnd / bgmLength);
				}
				else if bgmVolume > -1 {
				
					playMusicVolume(bgm, bgmVolume);
				}
				else if bgmLoopStart > -1 && bgmLoopEnd > -1 && bgmLength > -1 {
			
					playMusicLoopPoint(bgm, bgmLoopStart / bgmLength, bgmLoopEnd / bgmLength);
				}
				else {
			
					playMusicDefault(bgm);
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
