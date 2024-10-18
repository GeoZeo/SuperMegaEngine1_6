if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

cursorTimer += 0.1;
if cursorTimer >= 2 cursorTimer = 0;

if global.keyRightPressed {
	col++;
	if col > 7 {
	    col = 0;
	}
	cursorTimer = 0;
	playSFX(sfxMenuMove);
	h_as_timer = h_as_rate;
	h_as_init_timer = 0;
}
else if global.keyLeftPressed {
	col--;
	if col < 0 {
	    col = 7;
	}
	cursorTimer = 0;
	playSFX(sfxMenuMove);
	h_as_timer = h_as_rate;
	h_as_init_timer = 0;
}
if global.keyUpPressed {
	row--;
	if row < 0 {
	    row = 7;
	}
	cursorTimer = 0;
	playSFX(sfxMenuMove);
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
}
else if global.keyDownPressed {
	row++;
	if row > 7 {
	    row = 0;
	}
	cursorTimer = 0;
	playSFX(sfxMenuMove);
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
}
if cfgEnableDelayedAutoShifting {
	if global.keyRight {
		h_as_init_timer++;
		if h_as_init_timer >= h_as_delay {
			h_as_init_timer = h_as_delay;
			h_as_timer++;
			if h_as_timer >= h_as_rate {
				col++;
				if col > 7 {
				    col = 0;
				}
				cursorTimer = 0;
				playSFX(sfxMenuMove);
	
				h_as_timer = 0;
			}
		}
	}
	else if global.keyLeft {
		h_as_init_timer++;
		if h_as_init_timer >= h_as_delay {
			h_as_init_timer = h_as_delay;
			h_as_timer++;
			if h_as_timer >= h_as_rate {
				col--;
				if col < 0 {
				    col = 7;
				}
				cursorTimer = 0;
				playSFX(sfxMenuMove);
	
				h_as_timer = 0;
			}
		}
	}
	if global.keyUp {
		v_as_init_timer++;
		if v_as_init_timer >= v_as_delay {
			v_as_init_timer = v_as_delay;
			v_as_timer++;
			if v_as_timer >= v_as_rate {
				row--;
				if row < 0 {
				    row = 7;
				}
				cursorTimer = 0;
				playSFX(sfxMenuMove);
	
				v_as_timer = 0;
			}
		}
	}
	else if global.keyDown {
		v_as_init_timer++;
		if v_as_init_timer >= v_as_delay {
			v_as_init_timer = v_as_delay;
			v_as_timer++;
			if v_as_timer >= v_as_rate {
				row++;
				if row > 7 {
				    row = 0;
				}
				cursorTimer = 0;
				playSFX(sfxMenuMove);
	
				v_as_timer = 0;
			}
		}
	}
}
if global.keyJumpPressed { //Place marble
	var pos = row * 8 + col + 1;
	var value = string_char_at(password, pos);
	if value != color + 1 {
	    password = string_replace_at(password, pos, color + 1);
	}
	else {
	    password = string_replace_at(password, pos, "0");
	}
	cursorTimer = 0;
}
if global.keySelectPressed {  //Toggle marble colour
	color = 1 - color;
	cursorTimer = 0;
	playSFX(sfxMenuMove);
	print("Current color:", iif(color == 0, "red", "blue"));
}
if global.keyShootPressed {  //Exit
	var ID = instance_create(x, y, objFadeout);
	ID.type = "room";
	ID.myRoom = rmMainMenu;
	finished = true;
	h_as_timer = h_as_rate;
	h_as_init_timer = 0;
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
}
if global.keyPausePressed { //Finish
	h_as_timer = h_as_rate;
	h_as_init_timer = 0;
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
	if check_password(password) {
	    playSFX(sfxMenuSelect);
	    apply_password(password);
	    var ID = instance_create(x, y, objFadeout);
	    ID.type = "room";
	    if global.initialStageClear || cfgInitialStage == -1
			ID.myRoom = rmStageSelect;
		else {
			ID.myRoom = rmPlayerSelect;
			resetData();
		}
		finished = true;
	}
	else {
		cursorTimer = 0;
	    playSFX(sfxError);
	}
}

