if cfgEnableProjectileCollisionStacking return false;

if !other.shieldCanTouch return false;

with other {
    if sprite_index > -1 and (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
    && (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
    && (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
    && (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
        if !dead && !dying && (!other.singleHit or ds_list_find_index(other.ignore, self) < 0) {
            if (other.singleHit) ds_list_add(other.ignore, self);    
            if canHit {
                drawDamageNumber(x, y, damage[other.object_index]);
                healthpoints -= damage[other.object_index];
				if !object_is_ancestor(object_index, prtBoss) {
					if !hitWhite || healthpoints <= 0 visible = false;
					event_user(14);
				}
            }
            
            alarm[11] = flashTime;
            if (!other.passThrough || healthpoints > 0) and !other.unstoppable {
                with other 
				{
					event_user(15);
					instance_destroy();
				}
            }
            
            with other event_user(14);
            if !instance_exists(prtPlayer) or !prtPlayer.dead or !global.frozen
				if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
            
            if other.checkDeath {
                check_enemy_death();
            }
        }
    }
    else if sprite_index > -1 and !dead && !dying {
        other.reflected = true;
		with other event_user(14);
		with other event_user(15);
        event_user(0); //Reflect the projectiles
    }
}

