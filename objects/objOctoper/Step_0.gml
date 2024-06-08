event_inherited();

if !global.frozen && !dead && healthpoints > 0 {

	alive = true;

    if xspeed == 0 && yspeed == 0 {
        xspeed = image_xscale * 0.5;
        yspeed = -0.5;
    }
    if xspeed < 0 && x < __view_get( e__VW.XView, 0 ) + 96 {
        xspeed *= -1;
    }
    
    if xspeed > 0 && x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 16 {
        xspeed *= -1;
    }
    
    if yspeed < 0 && y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 {
        yspeed *= -1;
        if !instance_exists(objOctoShot) {
            var shot = instance_create(x + image_xscale * 32, y + 40, objOctoShot);
        }
    }
    
    if yspeed > 0 && y > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 {
        yspeed *= -1;
    }
    
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

