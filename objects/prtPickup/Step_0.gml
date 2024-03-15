if !global.frozen {
    image_speed = 1/6;
    
	if restartTimer {
		restartTimer = false;
		alarm[0] = 105 * 2;
		alarm[1] = 0;
		if (flash and !visible) visible = true;
		flash = false;
	}
	
    if flash {
        flashTimer++;
        if flashTimer >= 2 {
            visible = !visible;
            flashTimer = 0;
        }
    }
    
    if insideView() {
        checkGround();
        gravityCheckGround();
        generalCollision();
        
        y += yspeed * update_rate;
        if ground {
            xspeed = 0;
        }
        x += xspeed * update_rate;
        if !insideView() {
            instance_destroy();
        }
    }
}
else {
    if alarm[0] != -1
        alarm[0]++;
    if alarm[1] != -1
        alarm[1]++;
    image_speed = 0;
}

