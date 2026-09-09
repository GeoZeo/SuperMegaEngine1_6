if instance_exists(prtPlayer) {
    x = prtPlayer.x;
    y = prtPlayer.y;
}

if increaseHealth {
    if increaseHealthAmount > 0 && global._health < global._maxHealth {
        increaseTimer++;
        if increaseTimer >= 3 {
            global._health += 1;
			if global._health > global._maxHealth
				global._health = global._maxHealth;
            increaseHealthAmount -= 1;
            increaseTimer = 0;
        }
		stopSFX(sfxLand);
    }
    else {
		increaseHealthAmount = 0;
        increaseHealth = false;
        if global._health > global._maxHealth
            global._health = global._maxHealth;
        if (!increaseAmmo and !increaseAmmoOffscreen) {
			global.frozen = false;
			with prtPlayer canPause = true;
		}
        increaseTimer = 0;
        if (!increaseAmmo and !increaseAmmoOffscreen) stopSFX(sfxEnergyRestore);
    }
}
if increaseAmmo && !increaseHealth {
    if increaseAmmoAmount > 0 && global.weapons[global.currentWeapon].ammo < global.maxAmmo {
        increaseTimer++;
        if increaseTimer >= 3 {
            global.weapons[global.currentWeapon].ammo += 1;
			if global.weapons[global.currentWeapon].ammo > global.maxAmmo
				global.weapons[global.currentWeapon].ammo = global.maxAmmo;
            increaseAmmoAmount -= 1;
            increaseTimer = 0;
        }
		stopSFX(sfxLand);
    }
    else {
		if !increaseAmmoOffscreen increaseAmmoAmount = 0;
        increaseAmmo = false;
        if global.weapons[global.currentWeapon].ammo > global.maxAmmo
            global.weapons[global.currentWeapon].ammo = global.maxAmmo;
        if !increaseAmmoOffscreen {
			global.frozen = false;
			with prtPlayer canPause = true;
		}
        increaseTimer = 0;
        if !increaseAmmoOffscreen stopSFX(sfxEnergyRestore);
    }
}
if increaseAmmoOffscreen && !increaseAmmo && !increaseHealth {
    if increaseAmmoAmount > 0 && global.weapons[weaponToIncreaseIndex].ammo < global.maxAmmo {
        increaseTimer++;
        if increaseTimer >= 3 {
            global.weapons[weaponToIncreaseIndex].ammo++;
			if global.weapons[weaponToIncreaseIndex].ammo > global.maxAmmo
				global.weapons[weaponToIncreaseIndex].ammo = global.maxAmmo;
            increaseAmmoAmount--;
            increaseTimer = 0;
        }
		stopSFX(sfxLand);
    }
    else {
		increaseAmmoAmount = 0;
        increaseAmmoOffscreen = false;
        if global.weapons[weaponToIncreaseIndex].ammo > global.maxAmmo
            global.weapons[weaponToIncreaseIndex].ammo = global.maxAmmo;
        global.frozen = false;
		with prtPlayer canPause = true;
        increaseTimer = 0;
        stopSFX(sfxEnergyRestore);
    }
}

