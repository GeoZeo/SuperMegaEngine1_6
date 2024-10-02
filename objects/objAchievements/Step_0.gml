if (instance_exists(objFadeout)) exit;

//timer++;
if global.keyUpPressed {
    selected--;
    if selected < 0 {
        selected = num_menu_items - 1;
    }
    playSFX(sfxMenuMove);
}
else if global.keyDownPressed || global.keySelectPressed {
    selected++;
    if selected >= num_menu_items {
        selected = 0;
    }
    playSFX(sfxMenuMove);
}
if global.keyShootPressed {
    var ID = instance_create(0, 0, objFadeout);
    ID.type = "room";    
    ID.myRoom = rmMainMenu;
}

topItem = max(0, selected - maxItems + 1);

