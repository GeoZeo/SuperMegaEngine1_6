if !changeCol
{
	drawSelf();
}
else if sprite_index > -1 and visible
{
	drawSpriteColorSwapExt2 (
		sprite_index,
		image_index,
		x,
		y,
		image_xscale,
		image_yscale,
		image_angle,
		primaryCol,
		secondaryCol,
		global.primaryCol,
		global.secondaryCol,
		image_alpha
	);
}

