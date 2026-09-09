useShader = false;
if hitWhite
{
	if alarm[11] > -1 && healthpoints > 0 && !dying //Health check optional; comment it out if you don't want it
	{
		shader_set(shEnemyHit);
		useShader = true;
	}
}

if insideView() || checkFullSprite
	drawSelf();

if hitWhite
{
	if useShader 
	{
		shader_reset();
	}
}

