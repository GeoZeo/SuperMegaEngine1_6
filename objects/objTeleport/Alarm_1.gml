/// @description  Final teleport anim

if !prtPlayer.showReady && !prtPlayer.teleporting
{
	visible = true;
	sprite_index = prtPlayer.spriteTeleport;
	image_speed = prtPlayer.speedTeleport;
	out = true;
}

