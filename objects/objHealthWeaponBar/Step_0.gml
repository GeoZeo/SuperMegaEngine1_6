if instance_exists(prtPlayer) {
    x = prtPlayer.x;
    y = prtPlayer.y;
}

if increaseHealth {
    if increaseHealthAmount > 0 && global._health < global._maxHealth {
        increaseTimer++;
        if increaseTimer >= 3 {
            global._health += 1;
            increaseHealthAmount -= 1;
            increaseTimer = 0;
        }
    }
    else {
        increaseHealth = false;
        if global._health > global._maxHealth
            global._health = global._maxHealth;
        global.frozen = false;
        increaseTimer = 0;
        stopSFX(sfxEnergyRestore);
    }
}
else if increaseAmmo {
    if increaseAmmoAmount > 0 && global.weapons[global.currentWeapon].ammo < global.maxAmmo {
        increaseTimer++;
        if increaseTimer >= 3 {
            global.weapons[global.currentWeapon].ammo += 1;
            increaseAmmoAmount -= 1;
            increaseTimer = 0;
        }
    }
    else {
        increaseAmmo = false;
        if global.weapons[global.currentWeapon].ammo > global.maxAmmo
            global.weapons[global.currentWeapon].ammo = global.maxAmmo;
        global.frozen = false;
        increaseTimer = 0;
        stopSFX(sfxEnergyRestore);
    }
}
else if increaseAmmoOffscreen {
    if increaseAmmoAmount > 0 && global.weapons[weaponToIncreaseIndex].ammo < global.maxAmmo {
        increaseTimer++;
        if increaseTimer >= 3 {
            global.weapons[weaponToIncreaseIndex].ammo++;
            increaseAmmoAmount--;
            increaseTimer = 0;
        }
    }
    else {
        increaseAmmoOffscreen = false;
        if global.weapons[weaponToIncreaseIndex].ammo > global.maxAmmo
            global.weapons[weaponToIncreaseIndex].ammo = global.maxAmmo;
        global.frozen = false;
        increaseTimer = 0;
        stopSFX(sfxEnergyRestore);
    }
}

