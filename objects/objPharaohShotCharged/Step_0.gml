if !global.frozen {

    if groundEnabled {
        checkGround();
    }
    
    if collisionEnabled {
        generalCollision();
        if destroyOnHorizontalCollision && xspeed == 0 {
            instance_destroy();
        }          
        if destroyOnVerticalCollision && yspeed == 0 {
            instance_destroy();
        }
    }
    
    if gravityEnabled {
        if groundEnabled {
            gravityCheckGround();
        }
        else {
            gravityNoGround();
        }
    }
    
	
	
    xspeed += dir * xaccel;
    yspeed += yaccel;
    x += xspeed;
    y += yspeed;
	new_x = x;
	new_y = y;
    image_speed = img_speed;
}
else {
    image_speed = 0;
}


//Destroy upon level end
if !thrown {
	if instance_exists(objBossDeathTimer) {
		with objBossDeathTimer {
			if alarm[1] > 0 || prtPlayer.locked {
				with other instance_destroy();
			}
		}
	}
}

