if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

cursorTimer += 0.1;
if cursorTimer >= 2 cursorTimer = 0;

if global.keyUpPressed || global.keyDownPressed {
	if !surePhase {
		row = 1 - row;
		cursorTimer = row;
		playSFX(sfxMenuMove);
		v_as_timer = v_as_rate;
		v_as_init_timer = 0;
	}
}
if global.keyLeftPressed {
    if !surePhase {
		if row == 0 {
			selected--;
			if selected < 0 {
			    selected = num_saves;
			}
		}
		else if row == 1 && primed_index == -1 {
			action_index--;
			if action_index < 0 {
				action_index = 3;
			}
		}
	    if !(row == 1 && primed_index != -1) {
			cursorTimer = 0;
			playSFX(sfxMenuMove);
			h_as_timer = h_as_rate;
			h_as_init_timer = 0;
		}
	    if selected > 0 and saves[selected - 1] > -1 {
	        var map = saves[selected - 1];
	        if map > -1 and ds_map_exists(map, "character") {
			    setPlayer(map[? "character"]);
			}
	    }
	}
	else {
		isSure = !isSure;
		cursorTimer = 0;
		playSFX(sfxMenuMove);
		h_as_timer = h_as_rate;
		h_as_init_timer = 0;
	}
}
else if global.keyRightPressed or global.keySelectPressed {
	if !surePhase {
		if row == 0 {
			selected++;
			if selected > num_saves {
			    selected = 0;
			}
		}
		else if row == 1 && primed_index == -1 {
			action_index++;
			if action_index > 3 {
				action_index = 0;
			}
		}
	    if !(row == 1 && primed_index != -1) {
			cursorTimer = 0;
			playSFX(sfxMenuMove);
			h_as_timer = h_as_rate;
			h_as_init_timer = 0;
		}
	    if selected > 0 and saves[selected - 1] > -1 {
	        var map = saves[selected - 1];
	        if map > -1 and ds_map_exists(map, "character") {
			    setPlayer(map[? "character"]);
			}
	    }
	}
	else {
		isSure = !isSure;
		cursorTimer = 0;
		playSFX(sfxMenuMove);
		h_as_timer = h_as_rate;
		h_as_init_timer = 0;
	}
}
if cfgEnableDelayedAutoShifting {
	if global.keyUp || global.keyDown {
		if !surePhase {
			v_as_init_timer++;
			if v_as_init_timer >= v_as_delay {
				v_as_init_timer = v_as_delay;
				v_as_timer++;
				if v_as_timer >= v_as_rate {
					row = 1 - row;
					cursorTimer = row;
					playSFX(sfxMenuMove);
		
					v_as_timer = 0;
				}
			}
		}
	}
	if global.keyLeft {
	    if !surePhase {
			if !(row == 1 && primed_index != -1) {
				h_as_init_timer++;
				if h_as_init_timer >= h_as_delay {
					h_as_init_timer = h_as_delay;
					h_as_timer++;
					if h_as_timer >= h_as_rate {
						if row == 0 {
							selected--;
							if selected < 0 {
							    selected = num_saves;
							}
						}
						else if row == 1 && primed_index == -1 {
							action_index--;
							if action_index < 0 {
								action_index = 3;
							}
						}
					    if !(row == 1 && primed_index != -1) {
							cursorTimer = 0;
							playSFX(sfxMenuMove);
			
							h_as_timer = 0;
						}
					    if selected > 0 and saves[selected - 1] > -1 {
					        var map = saves[selected - 1];
					        if map > -1 and ds_map_exists(map, "character") {
							    setPlayer(map[? "character"]);
							}
					    }
					}
				}
			}
		}
		else {
			h_as_init_timer++;
			if h_as_init_timer >= h_as_delay {
				h_as_init_timer = h_as_delay;
				h_as_timer++;
				if h_as_timer >= h_as_rate {
					isSure = !isSure;
					cursorTimer = 0;
					playSFX(sfxMenuMove);
		
					h_as_timer = 0;
				}
			}
		}
	}
	else if global.keyRight or global.keySelect {
		if !surePhase {
			if !(row == 1 && primed_index != -1) {
				h_as_init_timer++;
				if h_as_init_timer >= h_as_delay {
					h_as_init_timer = h_as_delay;
					h_as_timer++;
					if h_as_timer >= h_as_rate {
						if row == 0 {
							selected++;
							if selected > num_saves {
							    selected = 0;
							}
						}
						else if row == 1 && primed_index == -1 {
							action_index++;
							if action_index > 3 {
								action_index = 0;
							}
						}
					    if !(row == 1 && primed_index != -1) {
							cursorTimer = 0;
							playSFX(sfxMenuMove);
			
							h_as_timer = 0;
						}
					    if selected > 0 and saves[selected - 1] > -1 {
					        var map = saves[selected - 1];
					        if map > -1 and ds_map_exists(map, "character") {
							    setPlayer(map[? "character"]);
							}
					    }
					}
				}
			}
		}
		else {
			h_as_init_timer++;
			if h_as_init_timer >= h_as_delay {
				h_as_init_timer = h_as_delay;
				h_as_timer++;
				if h_as_timer >= h_as_rate {
					isSure = !isSure;
					cursorTimer = 0;
					playSFX(sfxMenuMove);
		
					h_as_timer = 0;
				}
			}
		}
	}
}
if global.keyShootPressed {
	if !surePhase {
		if primed_index > -1 {
			playSFX(sfxMenuSelect);
			primed_index = -1;
		}
		else {
			if selected != 0 || row != 0 {
				selected = 0;
				row = 0;
				cursorTimer = 0;
				playSFX(sfxMenuMove);
			}
			else {
				var ID = instance_create(0, 0, objFadeout);
				ID.type = "room";
				ID.myRoom = rmMainMenu;
			}
		}
	}
	else {
		cursorTimer = 0;
		playSFX(sfxMenuSelect);
		surePhase = false;
	}
	h_as_timer = h_as_rate;
	h_as_init_timer = 0;
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
}
else if global.keyPausePressed || global.keyJumpPressed {
	h_as_timer = h_as_rate;
	h_as_init_timer = 0;
	v_as_timer = v_as_rate;
	v_as_init_timer = 0;
    if row = 0 {
		if surePhase && !isSure {
			surePhase = false;
			cursorTimer = 0;
			playSFX(sfxMenuSelect);
		}
		else {
			if selected > 0 && saves[selected - 1] == -1 && primed_index == -1 {  //Empty Slot?
		        cursorTimer = 0;
				playSFX(sfxError);
		    }
		    else if selected == 0 { //Back?
				playSFX(sfxMenuSelect);
				var ID = instance_create(0, 0, objFadeout);
				ID.type = "room";
				ID.myRoom = rmMainMenu;
			}
			else {
				playSFX(sfxMenuSelect);
				switch action_index {
					case 0:
						if surePhase {
							var ID = instance_create(0, 0, objFadeout);
							ID.type = "room";
							loadGame(selected - 1);
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
							cursorTimer = 0;
							surePhase = true;
							isSure = false;
						}
						break;
					case 1:
						if primed_index == -1 {
							primed_index = selected;
							cursorTimer = 0;
						}
						else {
							if selected == primed_index {
								primed_index = -1;
								cursorTimer = 0;
							}
							else {
								ds_map_secure_save(saves[primed_index - 1], "temp.dat");
								var map_1 = ds_map_secure_load("temp.dat");
								var map_2 = saves[selected - 1];
								if map_2 > -1 {
									ds_map_secure_save(map_2, "save" + string(primed_index - 1) + ".dat");
									saves[primed_index - 1] = map_2;
								}
								else {
									ds_map_destroy(saves[primed_index - 1]);
									file_delete("save" + string(primed_index - 1) + ".dat");
									saves[primed_index - 1] = -1;
								}
								if map_1 > -1 and ds_map_exists(map_1, "character") {
									setPlayer(map_1[? "character"]);
									ds_map_secure_save(map_1, "save" + string(selected - 1) + ".dat");
									saves[selected - 1] = map_1;
								}
								primed_index = -1;
								file_delete("temp.dat");
								cursorTimer = 0;
							}
						}
						break;
					case 2:
						if primed_index == -1 {
							primed_index = selected;
							cursorTimer = 0;
						}
						else {
							if selected == primed_index {
								primed_index = -1;
								cursorTimer = 0;
							}
							else {
								if surePhase || saves[selected - 1] == -1 {
									ds_map_secure_save(saves[primed_index - 1], "temp.dat");
									var map = ds_map_secure_load("temp.dat");
									if map > -1 and ds_map_exists(map, "character") {
										setPlayer(map[? "character"]);
										ds_map_secure_save(map, "save" + string(selected - 1) + ".dat");
										saves[selected - 1] = map;
									}
									primed_index = -1;
									file_delete("temp.dat");
									surePhase = false;
									cursorTimer = 0;
								}
								else {
									cursorTimer = 0;
									surePhase = true;
									isSure = false;
								}
							}
						}
						break;
					case 3:
						if surePhase {
							ds_map_destroy(saves[selected - 1]);
							file_delete("save" + string(selected - 1) + ".dat");
							saves[selected - 1] = -1;
							surePhase = false;
							cursorTimer = 0;
						}
						else {
							cursorTimer = 0;
							surePhase = true;
							isSure = false;
						}
						break;
				}
			}
		}
	}
	else if row == 1 {
		row = 0;
		primed_index = -1;
		cursorTimer = 0;
		playSFX(sfxMenuSelect);
	}
    
}

