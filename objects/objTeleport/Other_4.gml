teleportSprite = prtPlayer.spriteTeleport;
landSprite = prtPlayer.spriteLand;

if on && createScenery {
	instance_create(x-16, y-32, objMM3Teleporter);	
	createScenery = false;
}

