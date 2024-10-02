if prtPlayer.ground == true && plt >= 0 && plt.keepOnSwitch && (is_int(plt.yspeed) or plt.yspeed mod screenSpeedVert != 0)
{
	plt.y = round(plt.y);
	prtPlayer.y = round(prtPlayer.y);
}

prtPlayer.image_index = image_index;
if !prtPlayer.canSwitch
	with prtPlayer canSwitch = true;

//Makes sure we're facing the right direction after a transition if we fired and triggered a switch on the same frame while on a ladder.
if prtPlayer.isShoot && prtPlayer.climbing
	prtPlayer.image_xscale = initScaleX;

