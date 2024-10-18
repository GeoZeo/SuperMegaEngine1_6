event_inherited();

if !global.frozen && !dead && !dying {
    if image_index > 1 {
        // Turn right.
        if x < player_x
            image_xscale = 1;
        // Turn left.
        else
            image_xscale = -1;
    }
    
	if instance_exists(prtPlayer) {
		player_x = sprite_get_xcenter_object(prtPlayer);
		player_y = sprite_get_ycenter_object(prtPlayer);
	}
	
	dirX = player_x - sprite_get_xcenter();
    dirY = player_y - sprite_get_ycenter();
	if dirX != 0 || dirY != 0 {
	    len = sqrt(dirX * dirX + dirY * dirY);
	}
	
    if retreating {
        
        //generalCollision();
        if !place_free(x, y + yspeed) && place_free(x, y) {
            
			var mySolid = instance_place(x, y + yspeed, objSolid)
			if mySolid < 0
				if place_meeting(x, y + yspeed, prtMovingPlatformSolid) && !instance_place(x, y + yspeed, prtMovingPlatformSolid).dead
					mySolid = instance_place(x, y + yspeed, prtMovingPlatformSolid)
					
			if mySolid >= 0
			{
				y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index) - sprite_get_bbox_top(sprite_index) + 3;
				
				while place_meeting(x, y, mySolid)
					y += 1;
			}
			
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
			if instance_exists(prtPlayer) canMoveTimer = true;
            if canMoveTimer moveTimer += update_rate;
            xspeed = 0;
            if (moveTimer >= 180) {
                image_speed = 0.1;
            }
            
            if (floor(image_index) == 2) {
                moving = true;
				canMoveTimer = false;
                image_speed = 0;
                playSFX(sfxTaban);
            }
        }
        else {
			if dirX != 0 || dirY != 0 {
				xspeed = dirX * move_speed / len;
				yspeed = dirY * move_speed / len;
			}
			else {
				xspeed = 0;
				yspeed = 0;
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
	
	x += xspeed * update_rate;
    y += yspeed * update_rate;
	
}
else {
	if global.frozen {
		image_speed = 0;	
	}
    if dead || dying {
        counter = 0;
		canMoveTimer = false;
        moveTimer = 0;
        moving = false;
        retreating = false;
        image_index = 0;
        reflectProjectiles = true;
        
        hspeed = 0;
        vspeed = 0;
    }
}

