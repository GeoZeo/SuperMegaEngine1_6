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

idx = 0;
oldOption = option;

