draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

if !audio_is_playing(bgmMainMenu) {
    playMusicVolume(bgmMainMenu, 0.7);
}

menu[0] = "NEW GAME";
var current_item = 1;

if cfgEnableSaving {
    menu[current_item] = "LOAD GAME";
    current_item++;
}

if cfgEnablePasswords {
    menu[current_item] = "PASSWORD";
    current_item++;
}

if instance_number(prtAchievement) > 0 {
    menu[current_item] = "CHALLENGES";
    current_item++;
}

if cfgEnableKeyConfig and os_browser == browser_not_a_browser {
    menu[current_item] = "KEY CONFIG";
    current_item++;
    if global.GP > -1 {
        menu[current_item] = "GAMEPAD CONFIG";
        current_item++;
    }
}

menu[current_item] = "BACK";

num_menu_items = array_length_1d(menu);

selected = 0;

