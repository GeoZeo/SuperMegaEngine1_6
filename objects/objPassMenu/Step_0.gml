if canSelectOption {
    if !selectedOption {
        var lastOption = 1;
        if cfgEnableSaving {
            lastOption = 2;
        }
        if global.keyUpPressed {
            option--;
            if option < 0 {
                option = lastOption;
            }
            playSFX(sfxMenuMove);
        }
        if global.keySelectPressed || global.keyDownPressed {
            option++;
            if option > lastOption {
                option = 0;
            }
            playSFX(sfxMenuMove);
        }
        
        if global.keyJumpPressed || global.keyShootPressed || global.keyPausePressed {
            selectedOption = true;
            playSFX(sfxMenuSelect);
            
            var ID = instance_create(x, y, objFadeout);
            ID.type = "room";
            
            if option == 0
                ID.myRoom = rmStageSelect;
            else if option == 1
                ID.myRoom = global.passContinueRoom;
            else
                ID.myRoom = rmSaveGame;
        }
    }
}

