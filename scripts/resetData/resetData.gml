function resetData() {
	//resetData()
	global._lives = 2;
	global.checkpoint = false;
	global.levelStart = true;
			
	//Comment the following lines when your game has 8 bosses
	for(i = 0; i < 8; i++) {
		global.bossDefeated[i] = true;  //All bosses are defeated
	}
	global.bossDefeated[7] = false; //We have only Pharaoh Man
			
	for(var i = 0; i < global.totalWeapons; i++) {
		global.weapons[i].ammo = global.maxAmmo;
		global.weapons[i].unlocked = true; //Leave this line uncommented for testing purposes; comment it out when distributing your game.
	}
			
	objPharaohShotWeapon.unlocked = false;  //Leave it locked for testing weapon get
	//objRushJetWeapon.unlocked = false;  //Leave it locked for testing weapon get with utilities
	objTimeSlowWeapon.unlocked = false;  //Leave it locked for testing plates
		
	for (var i = 1; i < array_length_1d(global.items); i++) {   //Skip item 0 (lives)
		for (var j = 0; j < global.items[i].count; j++) {
			with global.items[i] {
				event_user(6);
			}
		}
	}
	
	

}
