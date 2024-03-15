if (global.totalCharacters == 1) {
    if cfgInitialStage > -1 {
        room_goto(cfgInitialStage);
    }
    else {
        room_goto(rmStageSelect);
    }
    exit;
}

char = 0;
setPlayer(global.characters[char]);
alpha = 0;

