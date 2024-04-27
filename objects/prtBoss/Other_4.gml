/// @description  Set the boss control to use
control = instance_nearest(x, y, objBossControl);
if bossID > -1
{
	with objTeleport
	{
		if boss > -1
			other.control.bossRush = true;
	}
}

