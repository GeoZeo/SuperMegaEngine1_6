//Teleport away
teleportingUp = true;
sprite_index = sprRushTeleport;
mask_index = sprRushTeleport;

if playTeleportSound {
	playSFX(sfxTeleportOut);
	playTeleportSound = false;
}
	
canCoil = false;

