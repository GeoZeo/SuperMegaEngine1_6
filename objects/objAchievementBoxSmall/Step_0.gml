var _oldActive = instance_exists(prtAchievement);
if !_oldActive instance_activate_object(prtAchievement);

timer++;
if timer % 3 == 0 {
    if phase == 0 {
        height += 2;
        if height > maxHeight {
			height = maxHeight;
            phase = 1;
            timer = 0;
			playSFX(sfxAchievement);
        }
    }
    if phase == 2 {
        height -= 2;
        if height <= 0 {
			if array_length_1d(global.achievementQueue) > 1 {
				for (var i = 0; i < array_length_1d(global.achievementQueue); i++) {
					if instance_exists(global.achievementQueue[i]) {
						if global.achievementQueue[i] == achievement_index {
							array_delete(global.achievementQueue, i, 1);
							break;
						}
					}
				}
				if array_length_1d(global.achievementQueue) > 0 {
					for (var i = 0; i < array_length_1d(global.achievementQueue); i++) {
						if instance_exists(global.achievementQueue[i]) {
							if global.achievementQueue[i] != achievement_index {
							
								if !global.achievementQueue[i].smallBox
									var box = instance_create(0, 0, objAchievementBox);
								else
									var box = instance_create(0, 0, objAchievementBoxSmall);
								
								box.txt = global.achievementQueue[i].achName;
								box.achievement_index = global.achievementQueue[i];
								if box.object_index == objAchievementBox
									box.oldFrozen = oldFrozen;
								
								achievementFound = true;
								break;
							}
						}
					}
				}
				instance_destroy();
			}
			else {
				for (var i = 0; i < array_length_1d(global.achievementQueue); i++) {
					if instance_exists(global.achievementQueue[i]) {
						if global.achievementQueue[i] == achievement_index {
							array_delete(global.achievementQueue, i, 1);
							break;
						}
					}
				}
			}
			instance_destroy();
        }
    }
}
if phase == 1 {
	arrowTimer++;
		
	if arrowTimer >= duration
		phase = 2;
}

if !_oldActive instance_deactivate_object(prtAchievement);

