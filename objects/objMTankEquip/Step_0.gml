event_inherited();

if using {
    show_debug_message("M-Tank restoring in progress...");
    timer++;
    if timer >= 3 {
        var proceed = false;
        
        //Restore weapons
        for(i = 0; i < global.totalWeapons; i++) {
            if global.weapons[i].ammo < global.maxAmmo {
                global.weapons[i].ammo++;
                if global.weapons[i].ammo > global.maxAmmo
                    global.weapons[i].ammo = global.maxAmmo;
				timer = 0;
                proceed = true;
            }
        }
        
        //Restore health
        if global._health < global._maxHealth {
            global._health++;
            if global._health > global._maxHealth
                global._health = global._maxHealth;
			timer = 0;
            proceed = true;
        }
        
        //If had nothing more to restore
        if !proceed {
            show_debug_message("Health and ammo restoring complete.");
            timer = 0;
            using = false;
            stopSFX(sfxEnergyRestore);
        }
    }
}

