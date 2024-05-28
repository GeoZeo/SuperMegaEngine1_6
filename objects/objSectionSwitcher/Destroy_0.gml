if !prtPlayer.canSwitch
	with prtPlayer canSwitch = true;

//Makes sure we're facing the right direction after a transition if we fired and triggered a switch on the same frame while on a ladder.
if prtPlayer.isShoot && prtPlayer.climbing
	prtPlayer.image_xscale = initScaleX;
	
with objArenaStartingPoint
{
	if insideView_Spr()
	{
		if !isMM
		{
			x = prtPlayer.x;
			y = prtPlayer.y;
			sprite_index = prtPlayer.sprite_index;
			image_speed = prtPlayer.image_speed;
			isMM = true;
			playerLockMovement();
			with prtPlayer visible = false;
			visible = true;
		}
	}	
}