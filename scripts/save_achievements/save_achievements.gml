/// @description  save_achievements()
function save_achievements() {

	var map = ds_map_create();

	//Achievements
	for (var i = 0; object_exists(i); i++) {
	    if object_get_parent(i) == prtAchievement {
	        ds_map_add(map, i.achName, i.completed);
	    }
	}

	ds_map_secure_save(map, "achievements.dat");



}
