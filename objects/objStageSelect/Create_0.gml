option = 8; //Starting from the topleft, going clockwise; the middle panel is option 8
imgSpd = 0.1; //For the selected panel
imgIndex = 0; //For the selected panel
showShop = 0;
selected = false;

playMusicVolume(bgmStageSelect, 0.6);

if numBossesDefeated() == 8 {
    instance_create(0, 0, objFlash);
    playSFX(sfxThunder);
}

idx = 0;
oldOption = option;

