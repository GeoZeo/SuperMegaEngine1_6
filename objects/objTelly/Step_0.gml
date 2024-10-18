event_inherited();

if !global.frozen && !dead && !dying {
    
	image_speed = 0.1;
	
	if instance_exists(prtPlayer) {
		player_x = sprite_get_xcenter_object(prtPlayer);
		player_y = sprite_get_ycenter_object(prtPlayer);
	}
	
	dirX = player_x - sprite_get_xcenter();
    dirY = player_y - sprite_get_ycenter();
	if dirX != 0 || dirY != 0 {
	    len = sqrt(dirX * dirX + dirY * dirY);
		xspeed = dirX * move_speed / len;
		yspeed = dirY * move_speed / len;
	}
	else {
		xspeed = 0;
		yspeed = 0;
	}
	
	x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else if global.frozen {
	image_speed = 0;
}

