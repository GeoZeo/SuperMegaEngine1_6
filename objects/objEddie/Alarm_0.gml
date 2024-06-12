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

