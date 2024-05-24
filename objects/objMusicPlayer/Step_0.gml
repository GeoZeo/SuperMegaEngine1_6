if !insideView_Spr()
{
	canPlay = true;
}
else if insideView_Spr() && !instance_exists(objSectionSwitcher) && (instance_exists(prtPlayer) and !prtPlayer.showReady and !prtPlayer.teleporting and !prtPlayer.dead)
{
	event_user(0);
}

