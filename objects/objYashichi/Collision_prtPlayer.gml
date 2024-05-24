event_inherited();

stopSFX(sfxEnergyRestore);
playSFX(sfxEnergyRestore);

global._health = global._maxHealth;

for (var i = 0; i < global.totalWeapons; i++) {
    global.weapons[i].ammo = global.maxAmmo;
}

