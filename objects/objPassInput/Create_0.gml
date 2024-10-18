row = 0;
col = 0;
color = 0;
password = string_repeat("0", 64);
finished = false;
cursorTimer = 0;
if !audio_is_playing(bgmPassScreen) {
    playMusicVolume(bgmPassScreen, 1);
}

//For auto-shifting through the options in the menu
//Horizontal
h_as_delay = 25;
h_as_rate = 5;
h_as_init_timer = h_as_delay;
h_as_timer = h_as_rate;

//Vertical
v_as_delay = 25;
v_as_rate = 5;
v_as_init_timer = v_as_delay;
v_as_timer = v_as_rate;

