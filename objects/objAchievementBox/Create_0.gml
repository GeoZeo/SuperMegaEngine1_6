height = 2;
maxHeight = 10;
timer = 0;
phase = 0;
duration = 2;
txt = "";
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 - (height / 2) * 8;
oldFrozen = global.frozen;	
global.frozen = true;
playSFX(sfxAchievement);
stopSFX(sfxLand);

