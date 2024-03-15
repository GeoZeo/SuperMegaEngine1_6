if !prtPlayer.canSwitch
	with prtPlayer canSwitch = true;

//Makes sure we're facing the right direction after a transition if we fired and triggered a switch on the same frame while on a ladder.
if prtPlayer.isShoot && prtPlayer.climbing
	prtPlayer.image_xscale = initScaleX;