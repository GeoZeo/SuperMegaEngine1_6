/// @description  reset_achievements()
function reset_achievements() {

	var map = ds_map_secure_load("achievements.dat");

	if map > -1 {
	    //Write achievements' completion status
	    for (var i = 0; object_exists(i); i++) {
	        if object_get_parent(i) == prtAchievement {
	            i.completed = false;
	            print("Reset achievement " + i.name + " to PENDING");
	        }
	    }
	}
	
	ds_map_secure_save(map, "achievements.dat");



}
