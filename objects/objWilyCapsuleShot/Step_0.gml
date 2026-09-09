if !global.frozen {
	if instance_exists(prtPlayer) {
		if !checkPlayerSpriteCenter
		{
			player_x = prtPlayer.x;
			player_y = prtPlayer.y;
		}
		else
		{
			player_x = sprite_get_xcenter_object(prtPlayer);
			player_y = sprite_get_ycenter_object(prtPlayer);
		}
	
	}
	
	image_speed = 20 / room_speed;
    x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else {
	image_speed = 0;
}

