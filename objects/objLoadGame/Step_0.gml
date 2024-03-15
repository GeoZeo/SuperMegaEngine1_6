if (instance_exists(objFadeout)) exit;

if global.keyUpPressed or global.keyLeftPressed {
    selected--;
    if selected < 0 {
        selected = num_saves;
    }
    playSFX(sfxMenuMove);
    if selected < num_saves and saves[selected] > -1 {
        var map = saves[selected];
        setPlayer(map[? "character"]);
    }
}
else if global.keyDownPressed or global.keyRightPressed or global.keySelectPressed {
    selected++;
    if selected > num_saves {
        selected = 0;
    }
    playSFX(sfxMenuMove);
    if selected < num_saves and saves[selected] > -1 {
        var map = saves[selected];
        setPlayer(map[? "character"]);
    }
}
else if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed {
 
    if selected < num_saves && saves[selected] == -1 {  //Empty Slot?
        playSFX(sfxError);
    }
    else {
        playSFX(sfxMenuSelect);
        var ID = instance_create(0, 0, objFadeout);
        ID.type = "room";
        if selected == num_saves {  //Back?
            ID.myRoom = rmMainMenu;
        }
        else {
            loadGame(selected);
            global.lastSave = selected;
            ID.myRoom = rmStageSelect;
        }
    }
    
}

