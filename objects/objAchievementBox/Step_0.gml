global.frozen = true;
timer++;
if timer % 3 == 0 {
    if phase == 0 {
        height += 2;
        if height >= maxHeight {
            phase = 1;
            timer = 0;
			if audio_system() == audio_new_system {
			    audio_pause_all();
			}
			playSFX(sfxAchievement);
        }
    }
    if phase == 2 {
        height -= 2;
        if height <= 0 {
			if array_length_1d(global.achievementQueue) > 1 {
				for (var i = 0; i < array_length_1d(global.achievementQueue); i++) {
					if global.achievementQueue[i] == achievement_index {
						array_delete(global.achievementQueue, i, 1);
						break;
					}
				}
				if array_length_1d(global.achievementQueue) > 0 {
					for (var i = 0; i < array_length_1d(global.achievementQueue); i++) {
						if global.achievementQueue[i] != achievement_index {
							var box = instance_create(0, 0, objAchievementBox);
							box.txt = global.achievementQueue[i].achName;
							box.achievement_index = global.achievementQueue[i];
							box.oldFrozen = oldFrozen;
							achievementFound = true;
							break;
						}
					}
				}
				else {
					global.frozen = oldFrozen;
					if audio_system() == audio_new_system {
					    audio_resume_all();
					}
				}
				instance_destroy();
			}
			else {
				for (var i = 0; i < array_length_1d(global.achievementQueue); i++) {
					if global.achievementQueue[i] == achievement_index {
						array_delete(global.achievementQueue, i, 1);
						break;
					}
				}
	            global.frozen = oldFrozen;
				if audio_system() == audio_new_system {
				    audio_resume_all();
				}
			}
			instance_destroy();
        }
    }
    y = global.viewY + global.viewHeight / 2 - (height / 2) * 8;
}
if phase == 1 {
	if !audio_is_playing(sfxAchievement)
		arrowTimer++;
	if (//timer > room_speed * duration or //Comment either one or neither of these lines out depending on how you see fit for making the box disappear.
	(!audio_is_playing(sfxAchievement) and (global.keyJumpPressed or global.keyPausePressed))
	)
		phase = 2;
}

