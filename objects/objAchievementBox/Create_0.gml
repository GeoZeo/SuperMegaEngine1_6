achievement_index = 0;
height = 2;
maxHeight = 10;
timer = 0;
arrowTimer = 0;
phase = 0;
duration = 2;
txt = "";
y = global.viewY + global.viewHeight / 2 - (height / 2) * 8;
oldFrozen = global.frozen;	
global.frozen = true;
with objPauseMenu instance_destroy();
stopSFX(sfxPause);

