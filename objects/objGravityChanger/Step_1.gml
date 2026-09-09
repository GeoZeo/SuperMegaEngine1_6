if !insideView_Spr()
{
	canChange = true;
}
else if insideView_Spr() && !instance_exists(objSectionSwitcher) && (!instance_exists(prtPlayer) or (!prtPlayer.showReady and !prtPlayer.teleporting and !prtPlayer.landing))
{
	event_user(0);
}

