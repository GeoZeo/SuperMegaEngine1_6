event_inherited();

if !global.frozen && !dead && !dying {
    
	image_speed = 0.1;
	
	with prtPlayer {
        dirX = sprite_get_xcenter() - sprite_get_xcenter_object(other);
        dirY = sprite_get_ycenter() - sprite_get_ycenter_object(other);
		if dirX != 0 || dirY != 0 {
	        len = sqrt(dirX * dirX + dirY * dirY);
	        other.xspeed = dirX * other.move_speed / len;
	        other.yspeed = dirY * other.move_speed / len;
		}
    }
	
	x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else if global.frozen {
	image_speed = 0;
}

