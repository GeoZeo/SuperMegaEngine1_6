var oldCol, oldSize, oldAlp, oldHalign, oldValign;
oldCol = draw_get_color();
oldAlp = draw_get_alpha();
oldHalign = draw_get_halign();
oldValign = draw_get_valign();

draw_set_font(global.font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
    
//BG
draw_set_color(c_white);
draw_text(x, y, string_hash_to_newline(string(damageValue)));

draw_set_color(oldCol);
draw_set_alpha(oldAlp);
draw_set_halign(oldHalign);
draw_set_valign(oldValign);

