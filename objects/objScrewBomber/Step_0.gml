event_inherited();

if !global.frozen and !dead and !dying {
    if instance_exists(prtPlayer) {
		player_distance = distance_to_object(prtPlayer);
	}
	
    if player_distance <= radius || shooting == true || image_index != 0 {
        if !shooting {
            shootTimer += update_rate;
            if shootTimer == 85 {
                image_index = 1;
            }
            else if floor(shootTimer) == 90 {
                image_index = 2;
                animate = true;
                shooting = true;
                shootTimer = 0;
            }
        }
        else {
            shootTimer += update_rate;
            if floor(shootTimer) == 24 {
                if shootAmount == 2 {
                    animate = false;
                    image_index = 1;
                    animateTimer = 0;
                }
            }
            else if floor(shootTimer) == 29 {
                if shootAmount == 2 {
                    shootTimer = 0;
                    shooting = false;
                    shootAmount = 0;
                    image_index = 0;
                }
            }
            else if floor(shootTimer) == 30 {
                if shootAmount != 2 {
                    var shootID = instance_create(x+8, y+3, objBeakBullet);
                    shootID.col = col;
					shootID.image_index = shootID.col;
                    shootID.dir = 0;
                    shootID.xscale = 1;
                        
                    shootID = instance_create(x+4, y+2, objBeakBullet);
                    shootID.col = col;
					shootID.image_index = shootID.col;
                    shootID.dir = 45;
                    shootID.xscale = 1;
                            
                    shootID = instance_create(x, y, objBeakBullet);
                    shootID.col = col;
					shootID.image_index = shootID.col;
                    shootID.dir = 90;
                    shootID.xscale = 1;
                            
                    shootID = instance_create(x-4, y+2, objBeakBullet);
                    shootID.col = col;
					shootID.image_index = shootID.col;
                    shootID.dir = 135;
                    shootID.xscale = 1;
                            
                    shootID = instance_create(x-8, y+3, objBeakBullet);
                    shootID.col = col;
					shootID.image_index = shootID.col;
                    shootID.dir = 180;
                    shootID.xscale = 1;
                            
                    shootAmount++;
                    shootTimer = 0;
                    playSFX(sfxEnemyShootClassic);
                }
            }
        }
            
        if animate {
            animateTimer += update_rate;
            if animateTimer >= 4 {
                animateTimer = 0;
                switch image_index {
                    case 2: image_index = 3; break;
                    case 3: image_index = 4; break;
                    case 4: image_index = 2; break;
                }
            }
        }
    }
    else {
        if shootTimer < 85
            shootTimer++;
    }
}
else {
    if dead || dying {
        shootTimer = 0;
        shooting = false;
        shootAmount = 0;
        image_index = 0;
        animate = false;
        animateTimer = 0;
    }
}

