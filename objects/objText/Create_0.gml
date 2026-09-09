text = "";
phrase = "";
phrases = ds_queue_create();

drawStart = false;

nameList = "";
name = "";
names = ds_queue_create();
name_concat = false;
name_line_breaks = 2;
name_xoffset = 0;
name_yoffset = -16;
name_colon = true;
oldName = "";
alphaBypass = false;

delay_normal = 4;
delay_fast = 1;
delay = delay_normal;
scroll_speed_default = 1;
scroll_speed_current = scroll_speed_default;
scroll_speed_max = 8;
scroll_accel = 3.5;
pos = 0;
line_spacing = 8;
line_width = 208;
arrow_delay = 0;   //0 = no arrow
arrow_x = 124;
arrow_y = y + (line_spacing * 7);
allow_fast_forward = true;
allow_jump_to_end = true;
skip_scroll = true;
allow_manual_page_turn = true;
page_delay = room_speed * 2; //0 = no auto turn page

alpha = 0;
alphaChange = 0.2;
alphaTimer = 0;
alphaTimerMax = 3;

font = global.font;

drawWindow = true;
windowSprite = -1;
windowCol = c_black;
windowAlpha = 1;
windowOutline = false;
windowLeft = x;
windowTop = y;
windowRight = x + line_width;
windowBottom = y + (line_spacing * 7) + 2;
windowXscaleMin = 0;
windowXscale = 1;
windowXscaleMax = 1;
windowYscaleMin = 0;
windowYscale = 1;
windowYscaleMax = 1;

increasingAlpha = true;

alarm[0] = 1;
instance_deactivate_object(self);

