var oldCol, oldAlpha;
oldCol = draw_get_color();
oldAlpha = draw_get_alpha();

draw_set_color(c_white);
draw_set_alpha(textAlpha);

draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_ext(round(room_width/2), round(room_height/2), string_hash_to_newline(disclaimerText), 10, 240);

draw_text(round(room_width/2), room_height-10, string_hash_to_newline(concat("BUILD:", GM_build_date)));


draw_set_color(oldCol);
draw_set_alpha(oldAlpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

