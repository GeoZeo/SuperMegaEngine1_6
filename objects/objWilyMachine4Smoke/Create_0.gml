isIntro = true;

if image_index >= 5 {
	image_speed = 0;
}
else if image_index >= 2 {
	image_speed = 4 / room_speed;
}
else {
	image_speed = 10 / room_speed;
}

