event_inherited();

if !global.frozen and instance_exists(prtPlayer) {
    
	image_speed = 4 / room_speed;
	
	if sprite_get_xcenter_object(prtPlayer) < sprite_get_xcenter() {
        image_xscale = -1;
    }        
    else {
        image_xscale = 1;
    }
    xspeed = spd * sign(sprite_get_xcenter_object(prtPlayer) - sprite_get_xcenter());
    yspeed = spd * sign(sprite_get_ycenter_object(prtPlayer) - sprite_get_ycenter());

	x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else if global.frozen {
	image_speed = 0;
}

