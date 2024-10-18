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

key[0] = global.leftKey;
key[1] = global.rightKey;
key[2] = global.upKey;
key[3] = global.downKey;
key[4] = global.jumpKey;
key[5] = global.shootKey;
key[6] = global.weaponSwitchLeftKey;
key[7] = global.weaponSwitchRightKey;
key[8] = global.pauseKey;
key[9] = global.selectKey;

var current_item = 10;
if cfgEnableSlideKey {
    menu[current_item] = "SLIDE";
    key[current_item] = global.slideKey;
    current_item++;
}

menu[current_item] = "RESET";
current_item++;
menu[current_item] = "BACK";

num_menu_items = array_length_1d(menu);

selected = 0;

surePhase = false;
isSure = false;

timer = 0;

//For auto-shifting through the options in the menu
as_delay = 25;
as_rate = 5;
as_init_timer = as_delay;
as_timer = as_rate;



