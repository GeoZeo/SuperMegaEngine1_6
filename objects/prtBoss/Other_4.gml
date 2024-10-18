/// @description  Set the boss control to use
event_inherited();

control = instance_nearest(x, y, objBossControl);
if bossID > -1
{
	with objTeleport
	{
		if boss > -1
			other.control.bossRush = true;
	}
}

//Get the current bottom of the section for pitfalls
section_bottom = prtPlayer.sectionBottom;

