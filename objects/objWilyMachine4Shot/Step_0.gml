event_inherited();

if !global.frozen {
	if xspeed == 0 {
		if image_index >= 0 and image_index < 1 {
			image_speed = 12 / room_speed;
		}
		else if image_index >= 1 and image_index < 2 {
			image_speed = 10 / room_speed;
		}
		else if image_index >= 2 and image_index < 4 {
			image_speed = 20 / room_speed;
		}
		else if (image_index >= 4 and image_index < 5) or image_index >= 6 {
			image_speed = 15 / room_speed;
		}
		else {
			image_speed = 60 / room_speed;
		}
	}
	else {
		if image_index < 6 {
			image_speed = 30 / room_speed;
		}
		else {
			image_speed = 15 / room_speed;
		}
	}
    if image_index > 6 and xspeed == 0 {
        xspeed = shot_xspeed;
		yspeed = shot_yspeed;
    }
    if xspeed != 0 && image_index < 5 {
        image_index = 5;
    }
    if image_index <= 6 and instance_exists(objWilyMachine4) and xspeed == 0 {
        x = objWilyMachine4.x + 20;
        y = objWilyMachine4.y + objWilyMachine4.sprite_height / 2 + 16;
    }
}
else {
	image_speed = 0;
}

