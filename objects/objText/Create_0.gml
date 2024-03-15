text = "";
phrase = "";
phrases = ds_queue_create();
delay = 4;
pos = -1;
line_spacing = 8;
arrow_delay = 0;   //0 = no arrow
allow_fast_forward = true;
allow_jump_to_end = true;
allow_manual_page_turn = true;
page_delay = room_speed * 2; //0 = no auto turn page
alarm[0] = 1;
instance_deactivate_object(self);

