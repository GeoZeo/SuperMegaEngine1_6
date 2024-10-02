/// @description  add_achievement(achievement)
function add_achievement(argument0) {

	var achievement = argument0;

	if !achievement.completed {
	    achievement.completed = true;
		array_push(global.achievementQueue, achievement);
		
		if !instance_exists(objAchievementBox) {
		    var box = instance_create(0, 0, objAchievementBox);
		    box.txt = achievement.achName;
			box.achievement_index = achievement;
		}
		
	    print("Challenge completed! " + achievement.achName);
	    save_achievements();
	}



}
