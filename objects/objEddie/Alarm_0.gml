sprite_index = sprRushTeleport;

if !instance_exists(objPauseMenu)
	playSFX(sfxTeleportOut);
	
image_index = 2.9;
image_speed = -anim_spd * 2;
leaving = true;
if place_meeting(x, y, objSolid) {
    y -= 2;
}

