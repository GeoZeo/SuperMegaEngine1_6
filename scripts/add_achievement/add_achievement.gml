/// @description  add_achievement(achievement, [boxSizeOverride])
function add_achievement(argument0) {

	var achievement = argument0;
	
	//print(argument_count);
	
	if argument_count > 1 {
		achievement.smallBox = argument1;
	}
	else {
		achievement.smallBox = achievement.smallBoxInit;
	}

	if !achievement.completed {
	    achievement.completed = true;
		array_push(global.achievementQueue, achievement);
		
		if !instance_exists(objAchievementBox) && !instance_exists(objAchievementBoxSmall) {
			if !achievement.smallBox {
				var box = instance_create(0, 0, objAchievementBox);
				box.txt = achievement.achName;
				box.achievement_index = achievement;
			}
			else {
				var box = instance_create(0, 0, objAchievementBoxSmall);
				box.txt = achievement.achName;
				box.achievement_index = achievement;
			}
		}
		
	    print("Challenge completed! " + achievement.achName);
	    save_achievements();
	}



}
