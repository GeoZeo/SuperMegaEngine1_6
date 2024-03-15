draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

if !audio_is_playing(bgmMainMenu) {
    playMusicVolume(bgmMainMenu, 0.7);
}

waiting = false;

menu[0] = "LEFT";
menu[1] = "RIGHT";
menu[2] = "UP";
menu[3] = "DOWN";
menu[4] = "JUMP";
menu[5] = "SHOOT";
menu[6] = "PREV WPN";
menu[7] = "NEXT WPN";
menu[8] = "PAUSE";
menu[9] = "SELECT";

key[0] = global.leftButton;
key[1] = global.rightButton;
key[2] = global.upButton;
key[3] = global.downButton;
key[4] = global.jumpButton;
key[5] = global.shootButton;
key[6] = global.weaponSwitchLeftButton;
key[7] = global.weaponSwitchRightButton;
key[8] = global.pauseButton;
key[9] = global.selectButton;

var current_item = 10;
if cfgEnableSlideKey {
    menu[current_item] = "SLIDE";
    key[current_item] = global.slideButton;
    current_item++;
}

menu[current_item] = "RESET";
current_item++;
menu[current_item] = "BACK";

num_menu_items = array_length_1d(menu);

selected = 0;



