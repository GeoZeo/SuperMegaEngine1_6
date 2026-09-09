if itemsLeft <= 0 || stuck
{
	sprite_index = sprRushTeleport;
	mask_index = sprRushTeleport;

	if playTeleportSound {
		playSFX(sfxTeleportOut);
		playTeleportSound = false;
	}
	
	image_index = 0;
	image_speed = 0;
	teleportTimer = 0;
	leaving = true;
}
else
{
	delivered = false;
	image_speed = anim_spd;
    image_index = 3;
}

