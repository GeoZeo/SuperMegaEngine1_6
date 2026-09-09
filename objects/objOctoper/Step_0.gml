event_inherited();

if !global.frozen && !dead && healthpoints > 0 {
	
	alive = true;
	
	
	if sprite_index == sprOctoperFadeIn {
		spriteTimer++;
		if spriteTimer <= 30 {
			image_index = 0;
		}
		else if spriteTimer <= 38 {
			image_index = 1;
		}
		else if spriteTimer <= 46 {
			image_index = 2;
		}
		else {
			sprite_index = sprOctoper;
			image_speed = 0;
			playerCanTouch = true;
			projCanTouch = true;
			shieldCanTouch = true;
			spriteTimer = 0;
		}
	}

    if sprite_index == sprOctoper {
		if xspeed == 0 && yspeed == 0 {
	        xspeed = image_xscale * 0.25;
	        yspeed = -1;
	    }
	    //if xspeed < 0 && x < global.viewX + 87  {
		//	x = global.viewX + 87;
	    //    xspeed *= -1;
	    //}
    
	    //if xspeed > 0 && x > start {
		//	x = start;
	    //    xspeed *= -1;
	    //}
    
	    if yspeed < 0 && y < top {
			y = top;
	        yspeed *= -1;
	        if !instance_exists(objOctoShot) {
	            var shot = instance_create(x + image_xscale * 55, y + 40, objOctoShot);
				shot.player_x = player_x;
				shot.player_y = player_y;
				with shot event_user(1);
	        }
	    }
    
	    if yspeed > 0 && y > bottom {
			y = bottom;
	        yspeed *= -1;
			bounceCount++;
			if bounceCount >= 3 {
				xspeed *= -1;
				bounceCount = 0;
			}
	    }
	
		x += xspeed * update_rate;
	    y += yspeed * update_rate;
	}
    
}
if !global.frozen && dying {
	
	if explosionCounter < explosionMax {
		
		if explosionTimer <= 0 {
			if explosionCounter < explosionMax {
				randomize();
				var explosion = instance_create((bbox_left+48) + random(abs(sprite_width)-48), (bbox_top+48) + random(abs(sprite_height)-48), objExplosion4);
				explosion.depth = (depth-10000000) - 1;
				explosionCounter++;
			}
			if explosionCounter >= explosionMax {
				explosionCounter = explosionMax;
				canInitDeath = true;
				
				if healthpoints <= 0 {
				    event_user(15);
				    if canInitDeath {
				        beenOutsideView = false;
						outsideSection = true;
				        visible = false;
						sprite_index = sprOctoperFadeIn;
						playerCanTouch = false;
						projCanTouch = false;
						shieldCanTouch = false;
						spriteTimer = 0;
				        dead = true;
				        x = xstart;
				        y = ystart;
				        canInitDeath = false;
				        xspeed = 0;
				        yspeed = 0;
				    }   
				}
			}
		}
		explosionTimer++;
		if explosionTimer >= explosionTime && (explosionCounter < explosionMax)
			explosionTimer = 0
	}

}

