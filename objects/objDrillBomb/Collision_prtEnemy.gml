with other {
    if !reflectProjectiles && damage[other.object_index] != 0
    && !(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
    && !(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
    && (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
        if !dead {
            if canHit {
                with other event_user(0);
                event_user(14);
            }
            alarm[11] = 2;            
            playSFX(sfxEnemyHit);            
        }
    }
    else if !dead {
        event_user(0); //Reflect the projectiles
    }
}

