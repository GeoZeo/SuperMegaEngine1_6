event_inherited();

if !global.frozen and !dead and !dying {
	
	if instance_exists(prtPlayer) {
		player_distance = distance_to_object(prtPlayer);
	}

    checkGround();
	checkWater();
    gravityCheckGround();
    generalCollision();
        
    if x < player_x
        image_xscale = 1;
    else
        image_xscale = -1;
        
    if player_distance <= radius {
        if canShoot {
            canShoot = false;
            image_index = 1;
        }
    }
    
    if !canShoot {
        cooldownTimer += update_rate;
        
        if floor(cooldownTimer) == 17 {
            cooldownTimer = 18;
            //Shoot
            var ID = instance_create(x+image_xscale*8, sprite_get_ycenter(), objMM1MetBullet);
            ID.dir = 45;
            ID.xscale = image_xscale;

            ID = instance_create(x+image_xscale*8, sprite_get_ycenter(), objMM1MetBullet);
            ID.dir = 0;
            ID.xscale = image_xscale;

            ID = instance_create(x+image_xscale*8, sprite_get_ycenter(), objMM1MetBullet);
            ID.dir = -45;
            ID.xscale = image_xscale;
            
            playSFX(sfxEnemyShootClassic);
        }
        else if floor(cooldownTimer) == 30 {
            image_index = 0;
        }
        else if floor(cooldownTimer) >= 80 {
            canShoot = true;
            cooldownTimer = 0;
        }
    }
    
    //Set the protection of the Met
    if image_index == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
        
    x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else {
    if dead || dying {
        cooldownTimer = 0;
        canShoot = true;
        image_index = 0;
    }
}



