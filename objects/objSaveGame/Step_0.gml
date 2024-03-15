if (instance_exists(objFadeout)) exit;

if global.keyUpPressed or global.keyLeftPressed {
    selected--;
    if selected < 0 {
        selected = num_saves;
    }
    playSFX(sfxMenuMove);
}
else if global.keyDownPressed or global.keyRightPressed or global.keySelectPressed {
    selected++;
    if selected > num_saves {
        selected = 0;
    }
    playSFX(sfxMenuMove);
}
else if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed {

    playSFX(sfxMenuSelect);
    if selected == num_saves {  //Back?
        var ID = instance_create(0, 0, objFadeout);
        ID.type = "room";
        ID.myRoom = rmPass;
    }
    else {
        saveGame(selected);        
        global.lastSave = selected;
        saves[selected] = ds_map_secure_load("save" + string(selected) + ".dat");
    }


}

