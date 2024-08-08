drawSelf();

if drawArrows && transportTimer >= 1 * 60 && transportTimer < transportTime
{
	draw_sprite(sprBeatArrowLeft, !(transportTimer % 30 < 15), (round(x)-10)-(2 * (image_xscale < 0)), round(y)-1);
	draw_sprite(sprBeatArrowUp, !(transportTimer % 30 < 15), round(x), round(y)-15);
	draw_sprite(sprBeatArrowRight, !(transportTimer % 30 < 15), (round(x)+12)-(2 * (image_xscale < 0)), round(y)-1);
}

