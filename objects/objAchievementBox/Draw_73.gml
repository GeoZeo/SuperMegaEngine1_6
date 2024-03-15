draw_set_colour(c_black);
draw_rectangle(__view_get( e__VW.XView, 0 ) + 16, y, __view_get( e__VW.XView, 0 ) + 240, y + height * 8, false);
for (var i = 0; i < 28; i++) {
    draw_sprite(sprBorderBlock, 0, __view_get( e__VW.XView, 0 ) + 16 + i * 8, y);  //Top border
    draw_sprite(sprBorderBlock, 0, __view_get( e__VW.XView, 0 ) + 16 + i * 8, y + (height - 1) * 8);   //Bottom border
}
for (var i = 1; i < height - 1; i++) {
    draw_sprite(sprBorderBlock, 0, __view_get( e__VW.XView, 0 ) + 16, y + i * 8);  //Left border
    draw_sprite(sprBorderBlock, 0, __view_get( e__VW.XView, 0 ) + 232, y + i * 8);  //Right border
}
if phase == 1 {
    draw_sprite(sprCrown, (timer div 8) % 2, __view_get( e__VW.XView, 0 ) + 40, y + 32);   //Crown
    draw_set_colour(c_white);
    draw_set_font(global.MM3font);
    draw_set_halign(fa_left);
    draw_text(__view_get( e__VW.XView, 0 ) + 48, y + 32, string_hash_to_newline(" \"" + string_upper(txt) + "\""));
    draw_text(__view_get( e__VW.XView, 0 ) + 40, y + 48, string_hash_to_newline("CHALLENGE COMPLETED!"));
}

