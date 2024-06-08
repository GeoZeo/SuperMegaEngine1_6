if id_of_origin != prtPlayer {
	with other {
	    if sprite_index > -1 and !reflectProjectiles && other.contactDamage != 0
	    && !(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
	    && !(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
	    && (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
	        if !dead && (!other.singleHit or ds_list_find_index(other.ignore, self) < 0) {
	            if (other.singleHit) ds_list_add(other.ignore, self);    
	            if canHit {
	                drawDamageNumber(x, y, other.contactDamage);
	                healthpoints -= other.contactDamage;
	                if !hitWhite visible = false;
	                event_user(14);
	            }
            
	            alarm[11] = 2;
	            if (!other.passThrough || healthpoints > 0) and !other.unstoppable {
	                with other instance_destroy();
	            }
            
	            stopSFX(sfxBuster);
	            playSFX(sfxEnemyHit);
            
	            if other.checkDeath {
	                check_enemy_death();
	            }
	        }
	    }
	    else if sprite_index > -1 and !dead {
	        other.reflected = true;
	        event_user(0); //Reflect the projectiles
	    }
	}
}

