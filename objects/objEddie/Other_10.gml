/// @description Reset Eddie if he goes offscreen and is acting as a level placement
if !called
{
	sprite_index = sprRushTeleport;
	mask_index = sprRushTeleport;
	teleporting = true;
	teleportTimer = 0;
	teleportY = 0;
	currentTeleportSpeed = 0;
	playTeleportSound = true;
	
	xspeed = 0;
	yspeed = 0;
	image_speed = 0;
	image_index = 0;
	prev_img_index = image_index;
	delivering = false;
	leaving = false;
	delivered = false;
	itemsLeft = items;
	stuck = false;
	ground = false;
	x = xstart;
	y = ystart;
	alarm[0] = -1;
}

