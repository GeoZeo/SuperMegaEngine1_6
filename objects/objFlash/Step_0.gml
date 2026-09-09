if (floor(alarm[0] / 2) % 2 == 0)
{
	with backShader canShade = true;
	with frontShader canShade = true;
}
else
{
	with backShader canShade = false;
	with frontShader canShade = false;
}

