teleportSprite = prtPlayer.spriteTeleport;

if on && createScenery {
	instance_create(x-16, y-32, objMM3Teleporter);	
	createScenery = false;
}

if instance_exists(prtPlayer)
	playerPrevX = round(prtPlayer.x);
	
	