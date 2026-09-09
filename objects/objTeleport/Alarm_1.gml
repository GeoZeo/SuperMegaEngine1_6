/// @description  Final teleport anim

if !prtPlayer.showReady && !prtPlayer.teleporting && !prtPlayer.landing
{
	visible = true;
	image_xscale = toDir;
	sprite_index = prtPlayer.spriteTeleport;
	image_speed = prtPlayer.speedTeleport;
	out = true;
}

