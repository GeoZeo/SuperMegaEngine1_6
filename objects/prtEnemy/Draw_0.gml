if !object_is_ancestor(object_index, prtBoss) && !object_is_ancestor(object_index, prtFortressBoss)
{
	useShader = false;
	if hitWhite
	{
		if alarm[11] > -1 && healthpoints > 0 && !dying //Health check optional; comment it out if you don't want it
		{
		    shader_set(shBossHit);
		    useShader = true;
		}
	}
}

drawSelf();

if !object_is_ancestor(object_index, prtBoss) && !object_is_ancestor(object_index, prtFortressBoss)
{
	if hitWhite
	{
		if useShader 
		{
		    shader_reset();
		}
	}
}

if cfgDebug || debug_mode {
    if useHitBox {
        draw_set_color(c_red);
        draw_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, 1);
    }
    if dead {
        draw_set_color(c_black);
    }
    else if reflectProjectiles {
        draw_set_color(c_yellow);
    }
    else {
        draw_set_color(c_white);
    }
    //Draw sprite anchor
    draw_line(x - 1, y - 1, x + 1, y + 1);  
    draw_line(x - 1, y + 1, x + 1, y - 1);
    //Draw bounding box
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
    //Draw velocity vector
    draw_arrow(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter() + xspeed * 10, sprite_get_ycenter() + yspeed * 10, 10);
    //Draw HP
	var _oldFont = draw_get_font();
	draw_set_font(global.font);
    draw_text(bbox_right, bbox_bottom, string_hash_to_newline(healthpoints));
	draw_set_font(_oldFont);
}

