if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

cursorTimer += 0.1;
if cursorTimer >= 2 cursorTimer = 0;

if global.keyUpPressed or global.keyLeftPressed {
    if !surePhase {
		selected--;
	    if selected < 0 {
	        selected = num_saves;
	    }
		if selected > 0 and saves[selected - 1] > -1 {
			var map = saves[selected - 1];
			if map > - 1 and ds_map_exists(map, "character") {
				setPlayer(map[? "character"]);
			}
		}
		else {
			setPlayer(currentChar);
		}
	}
	else {
		isSure = !isSure;
	}
	cursorTimer = 0;
    playSFX(sfxMenuMove);
	as_timer = as_rate;
	as_init_timer = 0;
}
else if global.keyDownPressed or global.keyRightPressed or global.keySelectPressed {
    if !surePhase {
		selected++;
	    if selected > num_saves {
	        selected = 0;
	    }
		if selected > 0 and saves[selected - 1] > -1 {
			var map = saves[selected - 1];
			if map > - 1 and ds_map_exists(map, "character") {
				setPlayer(map[? "character"]);
			}
		}
		else {
			setPlayer(currentChar);
		}
	}
	else {
		isSure = !isSure;
	}
	cursorTimer = 0;
    playSFX(sfxMenuMove);
	as_timer = as_rate;
	as_init_timer = 0;
}
if cfgEnableDelayedAutoShifting {
	if global.keyUp or global.keyLeft {
		as_init_timer++;
		if as_init_timer >= as_delay {
			as_init_timer = as_delay;
			as_timer++;
			if as_timer >= as_rate {
			    if !surePhase {
					selected--;
				    if selected < 0 {
				        selected = num_saves;
				    }
					if selected > 0 and saves[selected - 1] > -1 {
						var map = saves[selected - 1];
						if map > - 1 and ds_map_exists(map, "character") {
							setPlayer(map[? "character"]);
						}
					}
					else {
						setPlayer(currentChar);
					}
				}
				else {
					isSure = !isSure;
				}
				cursorTimer = 0;
			    playSFX(sfxMenuMove);
	
				as_timer = 0;
			}
		}
	}
	else if global.keyDown or global.keyRight or global.keySelect {
		as_init_timer++;
		if as_init_timer >= as_delay {
			as_init_timer = as_delay;
			as_timer++;
			if as_timer >= as_rate {
			    if !surePhase {
					selected++;
				    if selected > num_saves {
				        selected = 0;
				    }
					if selected > 0 and saves[selected - 1] > -1 {
						var map = saves[selected - 1];
						if map > - 1 and ds_map_exists(map, "character") {
							setPlayer(map[? "character"]);
						}
					}
					else {
						setPlayer(currentChar);
					}
				}
				else {
					isSure = !isSure;
				}
				cursorTimer = 0;
			    playSFX(sfxMenuMove);
	
				as_timer = 0;
			}
		}
	}
}
if global.keyShootPressed {
	if !surePhase {
		if selected != 0 {
			selected = 0;
			cursorTimer = 0;
			playSFX(sfxMenuMove);
		}
		else {
			var ID = instance_create(0, 0, objFadeout);
		    ID.type = "room";
		    ID.myRoom = rmPass;
		}
	}
	else {
		cursorTimer = 0;
		playSFX(sfxMenuSelect);
		surePhase = false;
	}
	as_timer = as_rate;
	as_init_timer = 0;
}
else if global.keyPausePressed || global.keyJumpPressed {
	as_timer = as_rate;
	as_init_timer = 0;
    playSFX(sfxMenuSelect);
    if selected == 0 {  //Back?
        var ID = instance_create(0, 0, objFadeout);
        ID.type = "room";
        ID.myRoom = rmPass;
    }
    else {
		cursorTimer = 0;
		if surePhase && !isSure {
			cursorTimer = 0;
			surePhase = false;
		}
		else {
			if surePhase || saves[selected - 1] == -1 {
				setPlayer(currentChar);
		        saveGame(selected - 1);        
		        global.lastSave = selected;
		        saves[selected - 1] = ds_map_secure_load("save" + string(selected - 1) + ".dat");
				
				surePhase = false;
			}
			else {
				surePhase = true;
				isSure = false;
			}
		}
    }


}

