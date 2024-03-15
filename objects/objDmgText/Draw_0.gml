var oldCol, oldSize, oldAlp;
oldCol = draw_get_color();
oldAlp = draw_get_alpha();

draw_set_font(global.font);
    
//BG
draw_set_color(c_white);
draw_text(x, y, string_hash_to_newline(string(damageValue)));

draw_set_color(oldCol);
draw_set_alpha(oldAlp);

