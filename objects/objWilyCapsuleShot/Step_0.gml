if !global.frozen {
	image_speed = 0.5;
    x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else {
	image_speed = 0;
}

