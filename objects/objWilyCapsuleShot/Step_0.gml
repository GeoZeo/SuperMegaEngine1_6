if !global.frozen {
	if instance_exists(prtPlayer) {
		player_x = prtPlayer.x;
		player_y = prtPlayer.y;
	}
	
	image_speed = 0.5;
    x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else {
	image_speed = 0;
}

