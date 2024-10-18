delay = 5;
var fadein = instance_create(0,0, objFadeIn);
fadein.deactivate = false;

draw_set_font(global.font);
draw_set_colour(c_white);

current_scene = 0;
next_scene = 0;

alarm[0] = room_speed * delay;  //Default time for transitioning to next scene

show_debug_message("Scene 0. Next one in " + string(alarm[0]/room_speed) + " seconds.");

next_room = room;		//Where to go after the cutscene
final_scene = 12;		//Last scene number
can_skip = false;		//Whether the cutscene can be skipped by pressing start
skip_fade_ins = true;	//Whether or not fade-ins can be skipped
skip_fade_outs = true;	//Whether or not fade-outs can be skipped


