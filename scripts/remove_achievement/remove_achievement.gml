/// @description  add_achievement(achievement)
function remove_achievement(argument0) {

	var achievement = argument0;

	if achievement.completed {
	    achievement.completed = false;
	    print("Reset achievement " + achievement.achName + " to PENDING");
	    save_achievements();
	}



}
