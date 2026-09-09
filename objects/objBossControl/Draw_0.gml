var _viewX = global.viewX + global.shakeX;
var _viewY = global.viewY + global.shakeY;

useShader = false;
if healthBarFlash && hitWhite {
	shader_set(shWhite);
	useShader = true;
}

if drawHealthBar == true
{
    for (i = 0; i < ceil(healthpointsStart / 28); i += 1)
	{
		draw_sprite_ext(sprHealthbarBackground, 0, _viewX+7+8+5+16+(sprite_get_width(sprHealthbarBackground)*i), _viewY+17, 1, 1, 0, c_black, 1);
	}
    
    for(i = 1; i <= global.bossHealth; i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, _viewX+7+8+1+5+16+(sprite_get_width(sprHealthbarBackground)*(ceil(i/28)-1)), _viewY+17+(sprite_get_height(sprHealthbarBackground)-((i%28)+(28*(i%28==0)))*2), 1, 1, 0, healthBarPrimaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, _viewX+7+8+1+5+16+(sprite_get_width(sprHealthbarBackground)*(ceil(i/28)-1)), _viewY+17+(sprite_get_height(sprHealthbarBackground)-((i%28)+(28*(i%28==0)))*2), 1, 1, 0, healthBarSecondaryCol, 1);
    }
}

if useShader {
	shader_reset();
}

