event_inherited();

if global.frozen == false && dead == false && dying == false
{
    if instance_exists(prtPlayer) {
		player_distance = distance_to_object(prtPlayer);
	}
	
	if shooting == false
    {
        if x < player_x
            image_xscale = 1;
        else
            image_xscale = -1;
            
        if player_distance <= radius
        {
            shooting = true;
        }
    }

    if (shooting)
    {
        shootTimer += update_rate;
        if floor(shootTimer) == 7 {
            shootTimer = 8;
            if x < player_x
                image_xscale = 1;
            else
                image_xscale = -1;
        
            image_index = 1;
        }
        else if floor(shootTimer) == 14 {
            image_index = 2;
        }
        else if floor(shootTimer) == 21 {
            image_index = 3;
        }
        else if floor(shootTimer) == 33 {
            image_index = 4;
        }
        else if floor(shootTimer) == 40 {
            image_index = 5;
        }
        else if floor(shootTimer) == 45 {    
            shootTimer = 46;
            var shootID;            
            var delta;
            
            if (image_xscale < 0)
                delta = -11;
            else
                delta = 11;
                            
            shootID = instance_create(x + delta, y - 2, objMM2Bullet);
            shootID.sprite_index = sprMM5Bullet;
            shootID.dir = 0;
            shootID.contactDamage = 4;
            shootID.xscale = image_xscale;
                
            playSFX(sfxEnemyShootClassic);
        }
        else if floor(shootTimer) == 51 {
            image_index = 4;
        }
        else if floor(shootTimer) == 58 {
            image_index = 3;
        }
        else if floor(shootTimer) == 69 {
            image_index = 2;
        }
        else if floor(shootTimer) == 76 {
            image_index = 1;
        }
        else if shootTimer >= 83 {
            image_index = 0;
            shootTimer = -30;
            shooting = false;
        }
    }
}
else {
    if dead || dying {
        shootTimer = 0;
        shooting = false;
        image_index = 0;
        image_speed = 0;
    }
	if global.frozen {
		image_speed = 0;
	}
}

