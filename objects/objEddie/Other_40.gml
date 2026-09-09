if sprite_index == sprEddie or ((leaving or (bbox_top >= global.viewY + (global.viewHeight) and yspeed > 0) or x+4 <= global.viewX or x-3 >= global.viewX + (global.viewWidth)) and sprite_index == sprRushTeleport and floor(image_index) == 0) {
    
	global.eddieInstance = -1;
	
	if called
	{
		instance_destroy();
	}
	else
	{
		if itemCollected instance_destroy();
		event_user(0);
	}
}

