if !global.frozen {
	if image_index >= 5 {
		if isIntro {
			image_index = 0;
			image_speed = 10 / room_speed;
		}
		else {
			image_speed = 0;
			image_index = 5;
		}
	}
	else if image_index >= 2 {
		image_speed = 4 / room_speed;
	}
	else {
		image_speed = 10 / room_speed;
	}
}
else
	image_speed = 0;

