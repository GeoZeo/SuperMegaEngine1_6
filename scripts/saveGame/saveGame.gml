function saveGame(argument0) {
	//saveGame(id)
	var map = ds_map_create();
	map[? "character"] = global.character;
	map[? "lives"] = global._lives;
	map[? "screws"] = global.screws;
	if cfgInitialStage > -1 map[? "initialStageClear"] = global.initialStageClear;
	for(var i = 0; i < 8; i++) {
	    map[? ("bossDefeated" + string(i))] = global.bossDefeated[i];
	}
	for (var i = 0; i < global.totalWeapons; i++) {
	    map[? ("weaponUnlocked" + string(i))] = global.weapons[i].unlocked;
	}
	for (var i = 0; i < array_length_1d(global.items); i++) {
	    map[? ("itemCount" + string(i))] = global.items[i].count;
	}
	for (var i = 0; object_exists(i); i++) {
		if object_get_parent(i) == prtAchievement {
			map[? ("achievement" + string(i))] = i.completed;
		}
	}
	ds_map_secure_save(map, "save" + string(argument0) + ".dat");
	show_debug_message("Game saved.");



}
