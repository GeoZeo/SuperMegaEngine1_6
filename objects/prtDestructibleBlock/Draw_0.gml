useShader = false;
if hitWhite
{
	if isHit && healthpoints > 0 //Health check optional; comment it out if you don't want it
	{
	    shader_set(shBossHit);
	    useShader = true;
	}
}

drawSelf();

if hitWhite
{
	if useShader
	{
	    shader_reset();
	}
}