event_inherited();

if !global.frozen {
	image_speed = 20 / room_speed;
	
    x = centerX + cos(degtorad(angle)) * radius;
    y = centerY + sin(degtorad(angle)) * radius;
    
    
	destroyTimer++;
	
	if radius_timer < closingTime {
		radius -= radius_dec;
		radius_timer++;
	}
	
	angle += rot;
	if radius_timer >= closingTime angle_accumul += rot;
	if angle_accumul >= 180 {
		radius_timer = 0;
		angle_accumul = 0;
	}
	if rot < rot_max {
		rot += rot_accel;
		if rot >= rot_max {
			rot = rot_max;
		}
	}
    
    if radius <= 0 {
		radius = 0;
    }
	
	if destroyTimer > maxRadius {
		instance_destroy();
	}
}
else {
	image_speed = 0;
}

