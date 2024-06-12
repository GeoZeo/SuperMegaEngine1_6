timer = 0; //The timer has multiple uses
megaX = round(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2));
megaY = __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ) + 40;
megaSpr = asset_get_index("spr" + global.sprName + "WeaponGetTeleport");
megaSpr2 = asset_get_index("spr" + global.sprName + "WeaponGet");
megaImg = 0;

text1Alpha = 0;
text2Alpha = 0;
text3Alpha = 0;

global.checkpoint = false;

//global.weaponID = objPharaohShotWeapon; //For testing
if global.weaponID > -1 {
    //global.weapons[global.weaponID].unlocked = true; //Unlocks the special weapon of the RM
    global.weaponID.unlocked = true; //Unlocks the special weapon of the RM
}
if global.bossID > -1 {
    global.bossDefeated[global.bossID] = true; //For the stage select screen
}

///Insert code for unlocking weapons upon defeating a certain number of RMs here

//Example (also used for testing):
//if numBossesDefeated() >= 8 {
//	if !objRushJetWeapon.unlocked global.utilityID = objRushJetWeapon; 
//	//if !objRushJetWeapon.unlocked && global.weaponID < 0 global.weaponID = objRushJetWeapon; //Set the utility as the main weapon ID instead of the utility ID if you just want to unlock the utility on its own instead of alongside a RM weapon
//}

///--------------------------------------------------------------------------///

if global.utilityID > -1 {
    //global.weapons[global.weaponID].unlocked = true; //Unlocks the utility you get for defeating the RM
    global.utilityID.unlocked = true; //Unlocks the utility you get for defeating the RM
}

phase = 0; //0 = preparing for moving up; 1 = moving up; 2 = de-teleporting; 3 = waiting; 4 = moving right; 5 = waiting for text;
           //6 = show "You got"; 7 = show weapon name/"and [utility name]"; 8 = flicker between normal and weapon colors; 9 = weapon colors and timer for leaving

doAgain = false; //Repeat phases 7-9? For if we unlock a utility/Rush ability for defeating a RM

if cfgWeaponPreview and (global.weaponID > -1 or global.utilityID > -1) {
    instance_create(16, 160, global.character);
    
    prtPlayer.readyTimer = 0;
	prtPlayer.showReady = false;
	
    //Teleporting sequence
    prtPlayer.teleporting = true;
    prtPlayer.teleportY = 0;
    prtPlayer.teleportTimer = 0;
    prtPlayer.sprite_index = prtPlayer.spriteTeleport;
    prtPlayer.image_speed = prtPlayer.speedTeleport;
    prtPlayer.image_index = 0;
    
    playerLockMovement();
	prtPlayer.canSpriteChange = false;
    
    with objHealthWeaponBar instance_destroy();
    
	if global.weaponID > -1 {
		with global.weaponID {
	        shots = 0;
	        timer = 0;
	        maxTimer = room_speed;
	        event_user(5);
	    }
	}
	
	if global.utilityID > -1 {
		with global.utilityID {
	        shots = 0;
	        timer = 0;
	        maxTimer = room_speed;
	    }
	}
}           

