event_inherited();

if objEnergyBalancerEquip.count > 0 && (global.currentWeapon == global.character.defaultWeapon.ID || global.weapons[global.currentWeapon].ammo >= global.maxAmmo) {
    var i = 0;
    var lowestIndex = 0;
    
    for (i = 1; i < global.totalWeapons; i++) {
        if (global.weapons[i].ammo < global.weapons[lowestIndex].ammo) {
            lowestIndex = i;
        }
    }
    
    if (global.weapons[lowestIndex].ammo < global.maxAmmo) {
        global.frozen = true;
        with objHealthWeaponBar {
            increaseAmmoOffscreen = true;
            weaponToIncreaseIndex = lowestIndex;
            increaseAmmoAmount = other.amount;
        }
        
        stopSFX(sfxEnergyRestore);
        loopSFX(sfxEnergyRestore);
    }
}
else if global.weapons[global.currentWeapon].ammo < global.maxAmmo {
    global.frozen = true;
    with objHealthWeaponBar {
        increaseAmmo = true;
        increaseAmmoAmount = other.amount;
    }
    
    stopSFX(sfxEnergyRestore);
    loopSFX(sfxEnergyRestore);
}

