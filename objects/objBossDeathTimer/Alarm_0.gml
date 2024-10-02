/// @description  Lock movement and play music

playerLockMovement(true);

var _time = 270;

if global.fortressStarted && global.fortressLevels[global.currentFortressLevel] == room &&
global.currentFortressLevel >= global.numFortressLevels - 1 {
	playMusicNoLoop(bgmBeatFinalBoss);
	_time = 330;
}
else {
	playMusicNoLoop(bgmVictory);
}

with prtPlayer event_user(0); //Resets the colors, so charging the buster won't affect the colors

alarm[1] = _time;

