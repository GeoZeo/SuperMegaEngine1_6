event_inherited();

xspeed = -1;
yspeed = 0;

//For ice physics
xforce = 0;
currentXforce = 0;

affectEnemies = false;
affectEnemiesGround = false;
affectEnemiesAir = false;

affectPlayer = true;
affectPlayerGround = true;
affectPlayerAir = true;

affectBosses = false;
affectBossesGround = false;
affectBossesAir = false;

affectItems = false;
affectItemsGround = false;
affectItemsAir = false;

affectProjectiles = false;

playerTeleporting = false;

if instance_exists(prtPlayer) && !prtPlayer.showReady && prtPlayer.teleporting && !prtPlayer.landing
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

alarm[0] = 1;

