with other {
    if reflectProjectiles == false && damage[other.object_index] != 0
    && !(reflectProjectilesLeft == true && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
    && !(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
    && (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
        if dead == false
        {
            if canHit == true
            {
                drawDamageNumber(x, y, damage[other.object_index]);
                healthpoints -= damage[other.object_index];
                visible = false;
            }
            alarm[11] = 2;
            with other instance_destroy();
            
            if other.xspeed == 0 //When it is not yet fired
            {
                global.weapons[global.currentWeapon].ammo -= global.weapons[global.currentWeapon].consumptionContact;
                if global.weapons[global.currentWeapon].ammo <= 0
                    global.weapons[global.currentWeapon].ammo = 0;
            }
            
            playSFX(sfxEnemyHit);
            
            check_enemy_death();
        }
    }
    else
    {
        event_user(0); //Reflect the projectiles
    }
}

