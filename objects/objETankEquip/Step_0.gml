event_inherited();

if using {
    if global._health < global._maxHealth {
        show_debug_message("E-Tank restoring in progress...");
        timer++;
        if timer >= 3 {
            global._health++;
            if global._health > global._maxHealth {
                global._health = global._maxHealth;
            }
            timer = 0;
        }
    }
    else {
        show_debug_message("Health restoring complete.");
        timer = 0;
        using = false;
        stopSFX(sfxEnergyRestore);
    }
}

