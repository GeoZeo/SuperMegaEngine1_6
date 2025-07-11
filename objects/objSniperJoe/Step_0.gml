event_inherited();

if !global.frozen && !dead && !dying {
	
	checkGround();
	gravityCheckGround();
	generalCollision();
	
    // Turn right.
    if x < player_x
        image_xscale = 1;
    // Turn left.
    else
        image_xscale = -1;
    
    if !shooting {
        shootTimer += update_rate;
        if shootTimer >= 120 {
            shootTimer = 0;
            shooting = true;
            image_index = 1;
            shootAmountMax = 3;
        }
    }
    else {
        shootTimer += update_rate;
        if floor(shootTimer) == 30 {
            shootTimer = 31;
            image_index = 1;
            var shootID, delta;
            
            if (image_xscale < 0)
                delta = 0;
            else
                delta = 18;
                            
            shootID = instance_create(x-12+delta, y - 11.5, objMM2Bullet);
            shootID.dir = 0;
            shootID.contactDamage = 2;
            shootID.xscale = image_xscale;
                
            playSFX(sfxEnemyShootClassic);
            
            shootAmount++;
        }
        else if floor(shootTimer) == 45 {
            shootTimer = 46;
            if shootAmount >= shootAmountMax {
                image_index = 0;
                shooting = false;
                shootAmount = 0;
                shootTimer = 0;
            }
            else {
                image_index = 1;
                shootTimer = 15;
            }
        }
    }
    
    //Set the protection of the Sniper Joe
    if floor(image_index) == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
		
	x += xspeed * update_rate;
    y += yspeed * update_rate;
}
else {
    if dead || dying {
        shootTimer = 0;
        shooting = false;
        shootAmount = 0;
        image_index = 0;
    }
}

