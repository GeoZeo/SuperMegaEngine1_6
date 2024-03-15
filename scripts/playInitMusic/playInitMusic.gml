/// @description playMusic()
function playInitMusic() {
	//Plays the stage's starting BGM
	
	if bgm > -1 {
		
		if bgmVolume > -1 {
			
			if bgmLoopStart > -1 && bgmLoopEnd > -1 && bgmLength > -1 {
				
				playMusicVolumeLoopPoint(bgm, bgmVolume, bgmLoopStart / bgmLength, bgmLoopEnd / bgmLength);
			}
			else {
				
				playMusicVolume(bgm, bgmVolume);
			}
		}
		else if bgmLoopStart > -1 && bgmLoopEnd > -1 && bgmLength > -1 {
			
			if bgmVolume > -1 {
				
				playMusicVolumeLoopPoint(bgm, bgmVolume, bgmLoopStart / bgmLength, bgmLoopEnd / bgmLength);
			}
			else {
				
				playMusicLoopPoint(bgm, bgmLoopStart / bgmLength, bgmLoopEnd / bgmLength);
			}
		}
		else {
			
			playMusic(bgm);
		}
	}
	
	
	
}
