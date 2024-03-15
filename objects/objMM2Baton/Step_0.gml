event_inherited();

if !global.frozen && !dead {
    if instance_exists(prtPlayer) && image_index > 1 {
        // Turn right.
        if x < prtPlayer.x
            image_xscale = 1;
        // Turn left.
        else
            image_xscale = -1;
    }
    
    if retreating {
        
        //generalCollision();
        if !place_free(x, y + yspeed) && place_free(x, y) {
            yspeed = 0;
        }
        
        if (yspeed == 0) {
            retreating = false;
            image_index = 0;
            image_speed = 0;
            moving = false;
            xspeed = 0;
            y -= 3;
        }
    }
    else {
        if !moving {
            moveTimer += update_rate;
            xspeed = 0;
            if (moveTimer >= 180) {
                image_speed = 0.1;
            }
            
            if (floor(image_index) == 2) {
                moving = true;
                image_speed = 0;
                playSFX(sfxTaban);
            }
        }
        else {
            if instance_exists(prtPlayer) {
                with prtPlayer {
                    dirX = sprite_get_xcenter() - sprite_get_xcenter_object(other);
                    dirY = sprite_get_ycenter() - sprite_get_ycenter_object(other);
					if dirX != 0 || dirY != 0 {
	                    len = sqrt(dirX * dirX + dirY * dirY);
	                    other.xspeed = dirX * other.move_speed / len;
	                    other.yspeed = dirY * other.move_speed / len;
					}
                }
            }
        }
    }
    
    if moving {
        image_speed = 0;
        counter += update_rate;
        
        if floor(counter) == 8 {
            counter = 9;
            if (floor(image_index) == 2) {
                counter = 0;
                image_index = 3;
            }
            else if (floor(image_index) == 3) {
                counter = 0;
                image_index = 4;
            }
            else if (floor(image_index) == 4) {
                counter = 0;
                image_index = 2;
            }
        }
    }
    
    //Set the protection of the Baton
    if image_index <= 1 {
        reflectProjectiles = true;
        image_xscale = 1;
    }
    else {
        reflectProjectiles = false;
    }
	
	//if place_meeting(x, y, objWater) {
		
	//	if moving && !place_meeting(x, y-8, objSolid) {
	//		moveTimer = 0;
	//		retreating = true;
	//		yspeed = -3;
	//	}
	//}
}
else {
    if dead {
        counter = 0;
        moveTimer = 0;
        moving = false;
        retreating = false;
        image_index = 0;
        reflectProjectiles = true;
        
        hspeed = 0;
        vspeed = 0;
    }
}

