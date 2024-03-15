if global.keyRightPressed {
    col++;
    if col > 7 {
        col = 0;
    }
}
if global.keyLeftPressed {
    col--;
    if col < 0 {
        col = 7;
    }
}
if global.keyUpPressed {
    row--;
    if row < 0 {
        row = 7;
    }
}
if global.keyDownPressed {
    row++;
    if row > 7 {
        row = 0;
    }
}
if global.keyShootPressed { //Toggle marble
    var pos = row * 8 + col + 1;
    var value = string_char_at(password, pos);
    if value == "0" {
        password = string_replace_at(password, pos, color + 1);
    }
    else {
        password = string_replace_at(password, pos, "0");
    }
}
if global.keySelectPressed {  //Select marble
    color = 1 - color;
    print("Current color:", iif(color == 0, "red", "blue"));
}
if global.keyJumpPressed {
    var ID = instance_create(x, y, objFadeout);
    ID.type = "room";
    ID.myRoom = rmMainMenu;
}
if global.keyPausePressed { //Finish
    if check_password(password) {
        playSFX(sfxMenuSelect);
        apply_password(password);
        var ID = instance_create(x, y, objFadeout);
        ID.type = "room";
        ID.myRoom = rmStageSelect;    
    }
    else {
        playSFX(sfxError);
    }
}

