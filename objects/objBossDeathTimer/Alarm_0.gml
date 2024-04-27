/// @description  Lock movement and play music

playerLockMovement(true);

if global.fortressStarted && global.fortressLevels[global.currentFortressLevel] == room &&
global.currentFortressLevel >= global.numFortressLevels - 1 {
	playMusicNoLoop(bgmBeatFinalBoss);
}
else {
	playMusicNoLoop(bgmVictory);
}

with prtPlayer event_user(0); //Resets the colors, so charging the buster won't affect the colors

alarm[1] = 270;

