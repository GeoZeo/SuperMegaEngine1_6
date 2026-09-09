event_inherited();

if objEnergyBalancerEquip.count > 0 && (global.currentWeapon == global.character.defaultWeapon.ID || global.weapons[global.currentWeapon].ammo >= global.maxAmmo) {
    var i = 0;
    var lowestIndex = 0;
	var _chrIndex = (array_get_index(global.characters, global.character.object_index));
    
    for (i = _chrIndex + 1; i < global.totalWeapons; i++) {
        if (global.weapons[i].ammo < global.weapons[lowestIndex].ammo
		&& global.weapons[i].unlocked
		&& !(ds_list_find_index(global.weapons[i].exceptCharacters, global.character.object_index) > -1 && ds_list_find_index(global.weapons[i].exceptCharacters, global.character.object_index) < ds_list_size(i.exceptCharacters))) {
            lowestIndex = i;
        }
    }
    
    if (global.weapons[lowestIndex].ammo < global.maxAmmo) {
        global.frozen = true;
		with prtPlayer canPause = false;
		with objPauseMenu instance_destroy();
		with objFadeIn instance_destroy();
		with objFadeout instance_destroy();
        with objHealthWeaponBar {
            increaseAmmoOffscreen = true;
            weaponToIncreaseIndex = lowestIndex;
            increaseAmmoAmount += other.itemAmount;
        }
        
        stopSFX(sfxEnergyRestore);
        loopSFX(sfxEnergyRestore);
		
		stopSFX(sfxLand);
		stopSFX(sfxPause);
    }
}
else if global.weapons[global.currentWeapon].ammo < global.maxAmmo {
    
	var incAmmount = 0;
	
	global.frozen = true;
	with prtPlayer canPause = false;
	with objPauseMenu instance_destroy();
	with objFadeIn instance_destroy();
	with objFadeout instance_destroy();
    with objHealthWeaponBar {
        increaseAmmo = true;
        increaseAmmoAmount += other.itemAmount;
		incAmmount = increaseAmmoAmount;
    }
	
	if objEnergyBalancerEquip.count > 0 {
		if (global.weapons[global.currentWeapon].ammo + incAmmount > global.maxAmmo) {
			var i = 0;
		    var lowestIndex = 0;
			var _chrIndex = (array_get_index(global.characters, global.character.object_index));
    
		    for (i = _chrIndex + 1; i < global.totalWeapons; i++) {
		        if (global.weapons[i].ammo < global.weapons[lowestIndex].ammo && global.weapons[i] != global.weapons[global.currentWeapon]
				&& global.weapons[i].unlocked
				&& !(ds_list_find_index(global.weapons[i].exceptCharacters, global.character.object_index) > -1 && ds_list_find_index(global.weapons[i].exceptCharacters, global.character.object_index) < ds_list_size(i.exceptCharacters))) {
		            lowestIndex = i;
		        }
		    }
		
			if (global.weapons[lowestIndex].ammo < global.maxAmmo) {
				with objHealthWeaponBar {
		            increaseAmmoOffscreen = true;
		            weaponToIncreaseIndex = lowestIndex;
		        }
			}
		}
	}
    
    stopSFX(sfxEnergyRestore);
    loopSFX(sfxEnergyRestore);
	
	stopSFX(sfxLand);
	stopSFX(sfxPause);
}

