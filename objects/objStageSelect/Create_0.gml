option = 8; //Starting from the topleft, going clockwise; the middle panel is option 8
imgSpd = 0.1; //For the selected panel
imgIndex = 0; //For the selected panel
showShop = 0;
selected = false;
flashed = false;
drawLogo = false;
playBGM = true;

if numBossesDefeated() < 8 {
	playMusicVolume(bgmStageSelect, 0.6);
	playBGM = false;
}
else {
	playNoMusic();
}

//Reset fortress and boss rush progress upon returning to the stage select? If not, comment all this out.
if global.fortressStarted {
	for (var i = 0; i < global.numFortressLevels; i++) {
	    global.fortressLevelDone[i] = false;
	}
	
	global.currentFortressLevel = 0;
	global.fortressStarted = false;
}

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

idx = 0;
oldOption = option;

