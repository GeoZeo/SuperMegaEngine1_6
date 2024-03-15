if drawHealthBar == true
{
    draw_sprite(sprHealthbarBackground, 0, __view_get( e__VW.XView, 0 )+7+8+5+16, __view_get( e__VW.YView, 0 )+17);
    
    for(i = 1; i <= global.bossHealth; i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, __view_get( e__VW.XView, 0 )+7+8+1+5+16, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, healthBarPrimaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, __view_get( e__VW.XView, 0 )+7+8+1+5+16, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, healthBarSecondaryCol, 1);
    }
}

