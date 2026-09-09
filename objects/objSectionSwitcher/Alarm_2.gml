if !cfgSwitchWeaponsWhileLocked and prtPlayer.canSwitch and canStopSwitching
	with prtPlayer canSwitch = false;
	
if canStopMusic and stopMusic
	stopSFX(global.bgm);

