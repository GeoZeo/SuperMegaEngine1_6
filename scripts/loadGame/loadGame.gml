function loadGame(argument0) {
	//loadGame(id)
	
	var map = ds_map_secure_load("save" + string(argument0) + ".dat");
	setPlayer(map[? "character"]);
	global._lives = map[? "lives"];
	global.screws = map[? "screws"];
	if cfgInitialStage > -1 global.initialStageClear = map[? "initialStageClear"];
	for(i = 0; i < 8; i++) {
	    global.bossDefeated[i] = map[? ("bossDefeated" + string(i))];
	}
	for (var i = 0; i < global.totalWeapons; i++) {
	    global.weapons[i].unlocked = map[? ("weaponUnlocked" + string(i))];
	}
	for (var i = 1; i < array_length_1d(global.items); i++) {   //Skip item 0 (lives)
		var oldCount = map[? ("itemCount" + string(i))];
		for (var j = 0; j < global.items[i].count; j++) {
		    with global.items[i] {
				event_user(6);
			}
		}
		global.items[i].count = oldCount;
	    for (var j = 0; j < global.items[i].count; j++) {
	        with global.items[i] {
				event_user(1);
	            event_user(4);
	        }
	    }
	}
	for (var i = 0; object_exists(i); i++) {
		if object_get_parent(i) == prtAchievement {
			if map[? ("achievement" + string(i))] == true {
				add_achievement(i);
			}
		}
	}
	show_debug_message("Game loaded.");



}
