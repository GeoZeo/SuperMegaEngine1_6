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
            if lastOption > 0 playSFX(sfxMenuMove);
        }
        if global.keySelectPressed || global.keyDownPressed {
            option++;
            if option > lastOption {
                option = 0;
            }
            if lastOption > 0 playSFX(sfxMenuMove);
        }
        
		if global.keyShootPressed {
			if lastOption > 0 {
				if option != 0 option = 0;
				playSFX(sfxMenuMove);
			}
		}
        else if global.keyJumpPressed || global.keyPausePressed {
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

