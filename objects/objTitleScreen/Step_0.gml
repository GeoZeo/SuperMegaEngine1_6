if (instance_exists(objFadeout) or instance_exists(objFadeIn)) exit;

//Timer for toggling the visibility of the "PRESS THE [PAUSE KEY/BUTTON HERE]" text
if canProceed {
    drawTextTimer += 1;
    if drawTextTimer >= drawTextTimerMax {
        drawTextTimer = 0;
        drawText = !drawText;
    }
}

//Going to the stage select/initial stage/main menu
if global.keyPausePressed && canProceed {
    canProceed = false;
    drawText = false;
    playSFX(sfxMenuSelect);
    
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";
    if !cfgEnableSaving && !cfgEnablePasswords && !cfgEnableKeyConfig {
        if cfgInitialStage > -1 {
            ID.myRoom = cfgInitialStage;
        }
        else {
            ID.myRoom = rmStageSelect;
        }
    }
    else {
        ID.myRoom = rmMainMenu;
    }
}

