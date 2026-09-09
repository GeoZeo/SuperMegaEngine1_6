delay = 5;
var fadein = instance_create(0,0, objFadeIn);
fadein.deactivate = false;

draw_set_font(global.font);
draw_set_colour(c_white);

current_scene = 0;
next_scene = 0;

alarm[0] = room_speed * delay;  //Default time for transitioning to next scene
current_alarm = alarm[0];

show_debug_message("Scene 0. Next one in " + string(alarm[0]/room_speed) + " seconds.");

next_room = room;   //Where to go after the cutscene
final_scene = 12;   //Last scene number
can_skip = false;   //Whether the cutscene can be skipped by pressing start
skip_fade_ins = false; //Whether fade-ins can be skipped
skip_fade_outs = false; //Whether fade-outs can be skipped
fade_out_skip = false; //Whether skipping triggers fade-out effects

