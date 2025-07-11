event_inherited();

if !global.frozen && !dead && healthpoints > 0 {
	
	alive = true;

    if xspeed == 0 && yspeed == 0 {
        xspeed = image_xscale * 0.5;
        yspeed = -0.5;
    }
    if xspeed < 0 && x < global.viewX + 96 {
        xspeed *= -1;
    }
    
    if xspeed > 0 && x > global.viewX + global.viewWidth - 16 {
        xspeed *= -1;
    }
    
    if yspeed < 0 && y < global.viewY + global.viewHeight / 2 {
        yspeed *= -1;
        if !instance_exists(objOctoShot) {
            var shot = instance_create(x + image_xscale * 32, y + 40, objOctoShot);
			shot.player_x = player_x;
			shot.player_y = player_y;
			with shot event_user(0);
        }
    }
    
    if yspeed > 0 && y > global.viewY + global.viewHeight - 64 {
        yspeed *= -1;
    }
	
	x += xspeed * update_rate;
    y += yspeed * update_rate;
    
}
if !global.frozen && dying {
	
	if explosionCounter < explosionMax {
		
		if explosionTimer <= 0 {
			if explosionCounter < explosionMax {
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

