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
            global.frozen = oldFrozen;
			if audio_system() == audio_new_system {
			    audio_resume_all();
			}
            instance_destroy();
        }
    }
    y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 - (height / 2) * 8;
}
if phase == 1 {
	if !audio_is_playing(sfxAchievement)
		arrowTimer++;
	if (timer > room_speed * duration or (!audio_is_playing(sfxAchievement) and (global.keyJumpPressed or global.keyPausePressed)))
		phase = 2;
}

