event_inherited();

if !global.frozen {
    
	image_speed = 4 / room_speed;
	
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

