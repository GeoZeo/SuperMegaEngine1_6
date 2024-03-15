/// @description  add_achievement(achievement)
function add_achievement(argument0) {

	var achievement = argument0;

	if !achievement.completed {
	    achievement.completed = true;
	    var box = instance_create(0, 0, objAchievementBox);
	    box.txt = achievement.name;
	    print("Challenge completed! " + achievement.name);
	    save_achievements();
	}



}
