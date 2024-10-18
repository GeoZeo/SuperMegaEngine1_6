event_inherited();

if !global.frozen {
    
	image_speed = 4 / room_speed;
	
	if instance_exists(prtPlayer) {
		player_x = sprite_get_xcenter_object(prtPlayer);
		player_y = sprite_get_ycenter_object(prtPlayer);
	}
	
	if player_x < sprite_get_xcenter() {
        image_xscale = -1;
    }        
    else {
        image_xscale = 1;
    }
    xspeed = spd * sign(player_x - sprite_get_xcenter());
    yspeed = spd * sign(player_y - sprite_get_ycenter());

	x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else if global.frozen {
	image_speed = 0;
}

