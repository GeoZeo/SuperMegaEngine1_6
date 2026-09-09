if cfgEnableProjectileCollisionStacking return false;

if !other.projCanTouch return false;

with other {
    if (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
    && (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
    && (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
    && (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
        if !dead && !dying {
			var _exploded = false;
            if canHit {
				with other event_user(14);
                with other event_user(2);
				_exploded = true;
                event_user(14);
            }
            alarm[11] = flashTime;            
            if (playHitSound and canPlayHitSound) && other.allowHitSound && !_exploded playSFX(sfxEnemyHit);            
        }
    }
    else if !dead && !dying {
		other.reflected = true;
		with other event_user(14);
		with other event_user(15);
        event_user(0); //Reflect the projectiles
    }
}

