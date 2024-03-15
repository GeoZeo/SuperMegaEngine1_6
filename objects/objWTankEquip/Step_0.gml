event_inherited();

if using {
    show_debug_message("W-Tank restoring in progress...");
    timer++;
    
    // If the weapon the user selected is already full.
    if firstCheck && global.weapons[useOnIndex].ammo >= global.maxAmmo {
        playSFX(sfxError);
        show_debug_message("Ammo for this weapon already full. W-Tank count: " + string(count));
        timer = 0;
        primed = false;
        using = false;
        useOnIndex = 0;
        
        firstCheck = true;
    }
    else {
        loopSFX(sfxEnergyRestore);
        if timer >= 3 {
            var proceed = false;
            firstCheck = false;
            
            // Restore the weapon energy of the selected weapon.
            if global.weapons[useOnIndex].ammo < global.maxAmmo {
                global.weapons[useOnIndex].ammo++;
                if global.weapons[useOnIndex].ammo > global.maxAmmo
                    global.weapons[useOnIndex].ammo = global.maxAmmo;
                proceed = true;
            }
            
            //If had nothing more to restore
            if !proceed {
                show_debug_message("Ammo restoring complete.");
                timer = 0;
                primed = false;
                using = false;
                useOnIndex = 0;
                count--;
                stopSFX(sfxEnergyRestore);
                
                firstCheck = true;
            }
        }
    }
}

