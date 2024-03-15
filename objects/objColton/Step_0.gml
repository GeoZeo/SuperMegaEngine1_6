event_inherited();

if !global.frozen and !dead {
    if !instance_exists(bulletID) {
        if instance_exists(prtPlayer) {
            if x >= prtPlayer.x
                image_xscale = -1;
            else
                image_xscale = 1;
        }
        
        shooting = true;
        animTimer = 0;
        image_index = 2;
        bulletID = instance_create(x+(15+4)*image_xscale, y-2, objColtonBullet);
        bulletID.image_xscale = image_xscale;
        playSFX(sfxColtonShoot);
    }
    
    if shooting {
        animTimer += 0.15 * update_rate;
        
        if animTimer >= 1 {
            animTimer = 0;
            
            switch image_index {
                case 2: image_index = 3; break;
                case 3: image_index = 4; break;
                case 4: shooting = false; image_index = 0; break;
            }
        }
    }
    else {
        animTimer += 0.05 * update_rate;
        if animTimer >= 1 {
            animTimer = 0;
            
            switch image_index {
                case 0: image_index = 1; break;
                case 1: image_index = 0; break;
            }   
        }
    }
}
else {
    if dead {
        shooting = false;
        animTimer = 0;
        image_index = 0;
    }
}

