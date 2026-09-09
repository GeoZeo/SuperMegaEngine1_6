/// @description  remove_achievement(achievement)
function remove_achievement(argument0) {

	var achievement = argument0;

	if achievement.completed {
	    achievement.completed = false;
		achievement.smallBox = achievement.smallBoxInit;
	    print("Reset achievement " + achievement.achName + " to PENDING");
	    save_achievements();
	}



}
