if itemsLeft <= 0
{
	sprite_index = sprRushTeleport;

	if !instance_exists(objPauseMenu)
		playSFX(sfxTeleportOut);
	
	image_index = 0;
	image_speed = 0;
	teleportTimer = 0;
	leaving = true;
	if place_meeting(x, y, objSolid) {
	    y -= 2;
	}
}
else
{
	delivered = false;
	image_speed = anim_spd;
    image_index = 3;
}

