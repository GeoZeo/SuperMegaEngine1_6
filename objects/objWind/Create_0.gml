event_inherited();

xspeed = -1;
yspeed = 0;

//For ice physics
xforce = 0;
currentXforce = 0;

affectEnemies = false;
affectPlayer = true;
affectProjectiles = false;
affectBosses = false;
affectItems = false;

playerTeleporting = false;

if instance_exists(prtPlayer) && !prtPlayer.showReady && prtPlayer.teleporting
&& instance_exists(objTeleport)
{
	with objTeleport
	{
		if sprite_index = prtPlayer.spriteTeleport
		{
			other.playerTeleporting = true;
			break;
		}
	}
}

