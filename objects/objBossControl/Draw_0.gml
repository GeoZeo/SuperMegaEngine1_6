if drawHealthBar == true
{
    for (i = 0; i < ceil(healthpointsStart / 28); i += 1)
	{
		draw_sprite(sprHealthbarBackground, 0, global.viewX+7+8+5+16+(sprite_get_width(sprHealthbarBackground)*i), global.viewY+17);
	}
    
    for(i = 1; i <= global.bossHealth; i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+7+8+1+5+16+(sprite_get_width(sprHealthbarBackground)*(ceil(i/28)-1)), global.viewY+17+(sprite_get_height(sprHealthbarBackground)-((i%28)+(28*(i%28==0)))*2), 1, 1, 0, healthBarPrimaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+7+8+1+5+16+(sprite_get_width(sprHealthbarBackground)*(ceil(i/28)-1)), global.viewY+17+(sprite_get_height(sprHealthbarBackground)-((i%28)+(28*(i%28==0)))*2), 1, 1, 0, healthBarSecondaryCol, 1);
    }
}

