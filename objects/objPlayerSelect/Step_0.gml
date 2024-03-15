if (instance_exists(objFadeout)) exit;

//Move cursor
if (global.keyLeftPressed) {
    playSFX(sfxMenuMove);
    char--;
}
if (global.keyRightPressed or global.keySelectPressed) {
    playSFX(sfxMenuMove);
    char++;
}
if (char >= global.totalCharacters) char = 0;
if (char < 0) char = global.totalCharacters - 1;

setPlayer(global.characters[char]);

//Select Player
if (global.keyPausePressed or global.keyShootPressed or global.keyJumpPressed) {
    playSFX(sfxMenuSelect);
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";
    if cfgInitialStage > -1 {
        ID.myRoom = cfgInitialStage;
    }
    else {
        ID.myRoom = rmStageSelect;
    }         
}

