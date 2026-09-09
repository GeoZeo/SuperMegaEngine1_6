draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.MM3font);
draw_set_colour(c_white);
option = 0;

objLifeEquip.count = global._lives;

arrowTimer = 0;
cursorCounter = 0;
cursorSprite = 0;
npcImg = 0;
megaImg = 0;
counterSpeed = 0;
screws = global.screws;

npc = instance_create(x, y, global.shopNPC);
dialogue_index = 0;
current_dialogue_array = -1;

text_character_index = 0;
scroll_frames_default = 3;
scroll_frames_fast = 2;
scroll_timer = 0;
scroll_speed_default = 1;
scroll_speed_current = scroll_speed_default;
scroll_speed_max = 8;
scroll_accel = 3.5;
dialogue_is_scroll = false;
scrolling = false;

showInfo = false;

showCursor = true;
hideCursorOnFinish = false;

total = 0;
item_index = -1;

isSure = false;

isFinished = false;

var bg = global.shopBackground;
if (bg == -1) bg = bgShop;
__background_set( e__BG.Index, 0, bg );

stopAllSFX();
playMusic(global.shopBGM, global.shopVolume, global.shopLoopStart, global.shopLoopEnd);

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

