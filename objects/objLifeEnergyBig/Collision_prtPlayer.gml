event_inherited();

if global._health < global._maxHealth
{
    global.frozen = true;
    with objHealthWeaponBar
    {
        increaseHealth = true;
        increaseHealthAmount = other.itemAmount;
    }
    
    stopSFX(sfxEnergyRestore);
    loopSFX(sfxEnergyRestore);
}

