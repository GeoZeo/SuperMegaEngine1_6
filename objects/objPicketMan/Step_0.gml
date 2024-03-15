event_inherited();

if !global.frozen && !dead {
    if instance_exists(prtPlayer) {
        if x < prtPlayer.x
            image_xscale = 1;
        else
            image_xscale = -1;
    }
    
    if !shooting {
        shootTimer += update_rate;
        if shootTimer >= 120 {
            shootTimer = 0;
            shooting = true;
            image_index = 1;
            randomize();
            shootAmountMax = choose(5, 10);
        }
    }
    else {
        shootTimer += update_rate;
        if floor(shootTimer) == 15 {
            shootTimer = 16;
            image_index = 2;
            var shootID = instance_create(x+image_xscale*16, sprite_get_ycenter(), objPicket);
            if instance_exists(shootID) {
                shootID.image_xscale = image_xscale;
            }
            shootAmount++;
        }
        else if floor(shootTimer) == 30 {
            if shootAmount >= shootAmountMax {
                image_index = 0;
                shooting = false;
                shootAmount = 0;
            }
            else {
                image_index = 1;
            }
            
            shootTimer = 0;
        }
    }
    
    
    //Set the protection of the Picketman
    if image_index == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
}
else {
    if dead {
        shootTimer = 0;
        shooting = false;
        shootAmount = 0;
        image_index = 0;
    }
}

