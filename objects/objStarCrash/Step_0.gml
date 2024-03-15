event_inherited();

if !global.frozen {
    
    //The init state, where the Star Crash grows until the normal size is reached
    //The mask is still the same as the normal size, however, to make things more fair
    //The sprite during this state is sprStarCrashInit
    endInitTimer++;
    if endInitTimer == floor((1/image_speed) * sprite_get_number(sprStarCrashInit)) {
        sprite_index = sprStarCrash;
        image_index = 0;
    }
    
    //Sticking to the player until fired or destroyed in any way
    if followPlayer && global.keyShootPressed && endInitTimer >= 8 { //Do not shoot the weapon until the init state is over
        with prtPlayer {
            other.dir = sign(image_xscale);
        }
           
        followPlayer = false;
        xspeed = dir * spd;
        
        global.weapons[global.currentWeapon].ammo -= global.weapons[global.currentWeapon].consumption;
        if global.weapons[global.currentWeapon].ammo <= 0
            global.weapons[global.currentWeapon].ammo = 0;
    }
}

