if drawWindow && drawStart {
	if windowSprite > -1 {
		draw_sprite_ext(windowSprite, 0, windowLeft + global.shakeX, windowTop + global.shakeY, windowXscale, windowYscale, 0, windowCol, windowAlpha);
	}
	else {
		draw_rectangle_color(windowLeft + global.shakeX, windowTop + global.shakeY, windowRight + global.shakeX, windowBottom + global.shakeY, windowCol, windowCol, windowCol, windowCol, windowOutline);
	}
}

var _oldFont = draw_get_font();
var _oldAlpha = draw_get_alpha();

if !name_concat && drawStart {
	draw_set_font(font);
	if !alphaBypass {
		draw_set_alpha(alpha);
	}
	
	if is_string(name) {
		
		draw_text_ext((x+global.shakeX)+name_xoffset, (y+global.shakeY)+name_yoffset, string_hash_to_newline(string_upper(name + string_repeat(":", name_colon and string_length(name) > 0))), line_spacing, line_width);
	}
	
	draw_set_alpha(_oldAlpha);
	draw_set_font(_oldFont);
}

draw_set_font(font);
draw_set_alpha(alpha);

if is_string(phrase) {
	
	draw_text_to_index_ext((x+global.shakeX), (y+global.shakeY), string_hash_to_newline(string_upper(phrase)), line_spacing, line_width, true, pos, 0);
    
    if alarm[2] > arrow_delay / 2 && pos >= string_length(phrase) && ds_queue_size(phrases) > 0 && increasingAlpha && alpha >= 1 {
        draw_sprite_ext(sprPassArrow, 0,  arrow_x + global.shakeX, arrow_y + global.shakeY, 1, 1, -90, c_white, 1);
    }
}

draw_set_alpha(_oldAlpha);
draw_set_font(_oldFont);

