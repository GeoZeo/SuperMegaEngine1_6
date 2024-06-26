drawSelf();

if drawArrows && transportTimer >= 1 * 60 && transportTimer < transportTime
{
	draw_sprite(sprBeatArrowLeft, !(transportTimer % 30 < 15), (x-10)-(2 * (image_xscale < 0)), y-1);
	draw_sprite(sprBeatArrowUp, !(transportTimer % 30 < 15), x, y-15);
	draw_sprite(sprBeatArrowRight, !(transportTimer % 30 < 15), (x+12)-(2 * (image_xscale < 0)), y-1);
}

