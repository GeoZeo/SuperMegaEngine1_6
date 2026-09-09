if errorPhase {
	errorPhase = false;
}
else if successPhase {
	if action_index == 0 {
		var ID = instance_create(0, 0, objFadeout);
		ID.type = "room";
		global.lastSave = selected;
		if global.initialStageClear || cfgInitialStage == -1
			ID.myRoom = rmStageSelect;
		else {
			ID.myRoom = rmInitialStage;
			global._lives = 2;
			global.checkpoint = false;
			global.levelStart = true;
			for(var i = 0; i < global.totalWeapons; i++) {
				global.weapons[i].ammo = global.maxAmmo;
			}
		}
	}
	else {
		successPhase = false;
	}
}

isOverwrite = false;
copiedIndex = -1;

cursorTimer = 0;

h_as_timer = h_as_rate;
h_as_init_timer = 0;
v_as_timer = v_as_rate;
v_as_init_timer = 0;

