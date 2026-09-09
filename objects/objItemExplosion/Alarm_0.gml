instance_destroy();

if !scripted
	randomDrop(my_range, 105 * 2, 0, 0);
else
	scriptedDrop(my_x, my_y, my_obj, my_timer, my_xspeed, my_yspeed);

