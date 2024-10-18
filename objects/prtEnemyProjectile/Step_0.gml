if !global.frozen {
	
	if instance_exists(prtPlayer) {
		player_x = prtPlayer.x;
		player_y = prtPlayer.y;
	}
	
    x += xspeed * update_rate;
    y += yspeed * update_rate;
}

