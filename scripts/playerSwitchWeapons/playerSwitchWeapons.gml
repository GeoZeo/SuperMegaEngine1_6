/// @description playerSwitchWeapons()
function playerSwitchWeapons() {
	//Allows for quick weapon switching
	//If you do not want quick weapon switching in your game, simply remove the script from prtPlayer's step event

	if (canSwitch || cfgSwitchWeaponsWhileLocked) && ((!instance_exists(objArenaStartingPoint) or !objArenaStartingPoint.isMM) or cfgSwitchWeaponsWhileTransitioning) {
		if global.totalWeapons < 2 or room == rmWeaponGet {
		    return false;
		}
		
		var switched = false;

		//Switching to the left
		if global.keyWeaponSwitchLeftPressed {
		    global.weapons[global.currentWeapon].initChargeTimer = 0;
		    global.weapons[global.currentWeapon].chargeTimer = 0;
			global.weapons[global.currentWeapon].chargeAnimTimer = 0;
		    do {
		        global.currentWeapon--;
		        if global.currentWeapon < 0
		            global.currentWeapon = global.totalWeapons - 1;            
		    } until global.weapons[global.currentWeapon].unlocked;
    
		    global.weapons[global.currentWeapon].initChargeTimer = 0;
		    global.weapons[global.currentWeapon].chargeTimer = 0;
			global.weapons[global.currentWeapon].chargeAnimTimer = 0;
		    with global.weapons[global.currentWeapon] event_user(0);

		    drawWeaponIcon = true;
		    drawWeaponIconTimer = 30;
    
		    global.weapon = global.currentWeapon;
		    event_user(0); //Colors
    
		    with prtPlayerProjectile if destroyOnSwitch instance_destroy();
		    with objReflectedProjectile if id_of_origin == prtPlayer instance_destroy();
		    with prtRush instance_destroy();
		    with objRushJet instance_destroy();
		    shootTimer = 20;
        
		    playSFX(sfxWeaponSwitch);
    
			with weapons[global.currentWeapon] sound_stop(chargeSFX);
			with weapons[global.currentWeapon] sound_stop(chargedSFX);
			playChargeSound = true;
			playChargedSound = true;
		    //sound_stop(sfxCharging);
		    //sound_stop(sfxCharged);
			
			switched = true;
		}

		//Switching to the right
		if global.keyWeaponSwitchRightPressed {
		    global.weapons[global.currentWeapon].initChargeTimer = 0;
		    global.weapons[global.currentWeapon].chargeTimer = 0;
			global.weapons[global.currentWeapon].chargeAnimTimer = 0;
		    do {
		        global.currentWeapon++;
		        if global.currentWeapon > global.totalWeapons - 1
		            global.currentWeapon = 0;
		    } until global.weapons[global.currentWeapon].unlocked;
    
		    global.weapons[global.currentWeapon].initChargeTimer = 0;
		    global.weapons[global.currentWeapon].chargeTimer = 0;
			global.weapons[global.currentWeapon].chargeAnimTimer = 0;
		    with global.weapons[global.currentWeapon] event_user(0);
    
		    drawWeaponIcon = true;
		    drawWeaponIconTimer = 30;
    
		    global.weapon = global.currentWeapon;
		    event_user(0); //Colors
    
		    with prtPlayerProjectile if destroyOnSwitch instance_destroy();
		    with objReflectedProjectile if id_of_origin == prtPlayer instance_destroy();
		    with prtRush instance_destroy();
		    with objRushJet instance_destroy();
		    shootTimer = 20;
            
		    playSFX(sfxWeaponSwitch);
    
		    with weapons[global.currentWeapon] sound_stop(chargeSFX);
			with weapons[global.currentWeapon] sound_stop(chargedSFX);
			playChargeSound = true;
			playChargedSound = true;
		    //sound_stop(sfxCharging);
		    //sound_stop(sfxCharged);
			
			switched = true;
		}

		//Holding the left and right weapon switch keys at the same time results in the default weapon being selected
		if global.keyWeaponSwitchLeft && global.keyWeaponSwitchRight && global.weapon != global.defaultWeapon.ID {
		    global.weapons[global.currentWeapon].initChargeTimer = 0;
		    global.weapons[global.currentWeapon].chargeTimer = 0;
			global.weapons[global.currentWeapon].chargeAnimTimer = 0;

		        global.currentWeapon = 0;
    
		    global.weapons[global.currentWeapon].initChargeTimer = 0;
		    global.weapons[global.currentWeapon].chargeTimer = 0;
			global.weapons[global.currentWeapon].chargeAnimTimer = 0;
		    with global.weapons[global.currentWeapon] event_user(0);
    
		    drawWeaponIcon = true;
		    drawWeaponIconTimer = 30;
    
		    global.weapon = global.currentWeapon;
		    event_user(0); //Colors
    
		    with prtPlayerProjectile if destroyOnSwitch instance_destroy();
		    with objReflectedProjectile if id_of_origin == prtPlayer instance_destroy();
		    with prtRush instance_destroy();
		    with objRushJet instance_destroy();
		    shootTimer = 20;
        
		    playSFX(sfxWeaponSwitch);
    
		    with weapons[global.currentWeapon] sound_stop(chargeSFX);
			with weapons[global.currentWeapon] sound_stop(chargedSFX);
			playChargeSound = true;
			playChargedSound = true;
		    //sound_stop(sfxCharging);
		    //sound_stop(sfxCharged);
			
			switched = true;
		}
		
		//Set the correct sprite if we switch mid-transition
		if switched {
			if (instance_exists(objSectionSwitcher) && cfgSwitchWeaponsWhileTransitioning) {
				if (isShoot or isThrow)
				{
					if !isSlide && !isHit && !teleporting && !climbing
					{
						with objSectionSwitcher
						{
							if sprite_index = other.spriteStep && ((plt >= 0 or other.ground) && other.isStep) && sprite_index != other.spriteStepDefault 
							{
								sprite_index = other.spriteStepDefault;
								image_speed = other.speedStepDefault;
							}
							else if sprite_index = other.spriteStand && sprite_index != other.spriteStandDefault 
							{
								sprite_index = other.spriteStandDefault;
								image_speed = other.speedStandDefault;
							}
							else if sprite_index = other.spriteWalk && sprite_index != other.spriteWalkDefault 
							{
								sprite_index = other.spriteWalkDefault;
								image_speed = other.speedWalkDefault;
							}
							else if sprite_index = other.spriteJump && sprite_index != other.spriteJumpDefault 
							{
								sprite_index = other.spriteJumpDefault;
								image_speed = other.speedJumpDefault;
							}
							other.sprite_index = sprite_index;
							other.image_speed = image_speed;
						}
					}
				}
			}
		}
	}

	//Timer
	if drawWeaponIconTimer != -1 {
	    drawWeaponIconTimer--;
	    if drawWeaponIconTimer == 0 {
	        drawWeaponIcon = false;
	    }
	}



}
