global.damageMultiplier = 1;

option = 0;
selectedOption = false;
global.checkpoint = false;
global.levelStart = true;

if global._lives < 0 {
    global._lives = 2;
    gameOver = true;
    canSelectOption = false;
    if !audio_is_playing(bgmGameOver) {
        playMusicNoLoopVolume(bgmGameOver, 1);
    }
    alarm[0] = 240;
	
	if numRushBossesDefeated() > 0 {
		//Initialize all rush bosses as undefeated (this is the correct behavior)
		for(var i = 0; i < 8; i++) {
		    global.bossRushDefeated[i] = false; 
		}

		//While there are not other bosses, let's overwrite this for testing
		//Comment the following lines when your game has 8 bosses
		for(var i = 0; i < 8; i++) {
		    global.bossRushDefeated[i] = true;  //All rush bosses are defeated
		}
		global.bossRushDefeated[7] = false; //We have only Pharaoh Man
	}
}
else {
    gameOver = false;
    canSelectOption = true;
    
    if global.passPlayVictory && !audio_is_playing(bgmWeaponGet) {
        playMusicVolume(bgmWeaponGet, 1);
    }
	else if !global.passPlayVictory && !audio_is_playing(bgmPassScreen) {
		playMusicVolume(bgmPassScreen, 1);
	}
}
    
for(var i = 0; i < global.totalWeapons; i++){
    global.weapons[i].ammo = global.maxAmmo;
}

pass = make_password();
print("Password", pass);

