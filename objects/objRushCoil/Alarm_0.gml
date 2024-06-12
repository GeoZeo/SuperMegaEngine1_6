//Teleport away
teleportingUp = true;
sprite_index = sprRushTeleport;
mask_index = sprRushTeleport;

if !instance_exists(objPauseMenu)
	playSFX(sfxTeleportOut);
	
canCoil = false;

