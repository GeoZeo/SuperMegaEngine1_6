event_inherited();

if global._health < global._maxHealth
{
    global.frozen = true;
	with objPauseMenu instance_destroy();
	with objFadeIn instance_destroy();
	with objFadeout instance_destroy();
    with objHealthWeaponBar
    {
        increaseHealth = true;
        increaseHealthAmount = other.itemAmount;
    }
    
    stopSFX(sfxEnergyRestore);
    loopSFX(sfxEnergyRestore);
	
	stopSFX(sfxLand);
	stopSFX(sfxPause);
}

