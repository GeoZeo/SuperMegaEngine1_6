event_inherited();

if !global.frozen and !dead and !dying {
    if !shooting {
        shootTimer += update_rate;
        if floor(shootTimer) == 90
            image_index = 1;
        else if floor(shootTimer) == 97
            image_index = 2;
        else if floor(shootTimer) == 104
            image_index = 3;
        else if floor(shootTimer) == 107 {
            shootTimer = 0;
            shooting = true;
        }
    }
    else {
        shootTimer += update_rate;
        if floor(shootTimer) == 1 {
            shootTimer = 2;
            var shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
            shootID.col = col;
			shootID.image_index = shootID.col;
            shootID.dir = 45;
            shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
        }
        else if floor(shootTimer) == 31 {
            shootTimer = 32;
            var shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
            shootID.col = col;
			shootID.image_index = shootID.col;
            shootID.dir = 15;
            shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
        }
        else if floor(shootTimer) == 61 {
            shootTimer = 62;
            var shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
            shootID.col = col;
			shootID.image_index = shootID.col;
            shootID.dir = -15;
            shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
        }
        else if floor(shootTimer) == 91 {
            shootTimer = 92;
            var shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
            shootID.col = col;
			shootID.image_index = shootID.col;
            shootID.dir = -45;
            shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
                
            image_index = 2;
        }
        else if floor(shootTimer) == 98 {
            image_index = 1;
        }
        else if floor(shootTimer) == 105 {
            image_index = 0;
            shooting = false;
            shootTimer = 0;
        }
    }
    
    
    //Handle's the Beak's protection
    if image_index == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
}
else {
    if dead || dying {
        shootTimer = 0;
        shooting = false;
        image_index = 0;
    }
}

