if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

timer++;
if timer >= 30 timer = 0;

if canSelectOption {
	
    if !selectedOption {
		var lastOption = 0;
		if global.passContinueRoom != cfgInitialStage || (global.initialStageClear and cfgInitialStageReplayable) {
			lastOption++;
		}
        if cfgEnableSaving {
            lastOption++;
        }
        if global.keyUpPressed {
            option--;
            if option < 0 {
                option = lastOption;
            }
            if lastOption > 0 {
				timer = 0;
				playSFX(sfxMenuMove);
				as_timer = as_rate;
				as_init_timer = 0;
			}
        }
        else if global.keySelectPressed || global.keyDownPressed {
            option++;
            if option > lastOption {
                option = 0;
            }
            if lastOption > 0 {
				timer = 0;
				playSFX(sfxMenuMove);
				as_timer = as_rate;
				as_init_timer = 0;
			}
        }
		if cfgEnableDelayedAutoShifting {
	        if global.keyUp {
				as_init_timer++;
				if as_init_timer >= as_delay {
					as_init_timer = as_delay;
					as_timer++;
					if as_timer >= as_rate {
			            option--;
			            if option < 0 {
			                option = lastOption;
			            }
			            if lastOption > 0 {
							timer = 0;
							playSFX(sfxMenuMove);
						
							as_timer = 0;
						}
					}
				}
	        }
	        else if global.keySelect || global.keyDown {
	            as_init_timer++;
				if as_init_timer >= as_delay {
					as_init_timer = as_delay;
					as_timer++;
					if as_timer >= as_rate {
						option++;
			            if option > lastOption {
			                option = 0;
			            }
			            if lastOption > 0 {
							timer = 0;
							playSFX(sfxMenuMove);
				
							as_timer = 0;
						}
					}
				}
	        }
		}
		if global.keyShootPressed {
			if lastOption > 0 {
				if option != 0 {
					option = 0;
					timer = 0;
					playSFX(sfxMenuMove);
					as_timer = as_rate;
					as_init_timer = 0;
				}
			}
		}
        else if global.keyJumpPressed || global.keyPausePressed {
            as_timer = as_rate;
			as_init_timer = 0;
			
			selectedOption = true;
            playSFX(sfxMenuSelect);
            
            var ID = instance_create(x, y, objFadeout);
            ID.type = "room";
            
            if option == 0 {
				if global.passContinueRoom != cfgInitialStage || global.initialStageClear {
					ID.myRoom = rmStageSelect;
				}
				else {
					ID.myRoom = global.passContinueRoom;
				}
			}
            else if option == 1 {
				if global.passContinueRoom != cfgInitialStage || (global.initialStageClear and cfgInitialStageReplayable) {
					ID.myRoom = global.passContinueRoom;
				}
				else {
					ID.myRoom = rmSaveGame;
				}
			}
            else {
                ID.myRoom = rmSaveGame;
			}
        }
    }
}

