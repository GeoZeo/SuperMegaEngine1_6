var _x = (global.viewX + global.shakeX);
var _y = (global.viewY + global.shakeY) + global.viewHeight / 2 - (height / 2) * 8;
var oldCol = draw_get_color();
var oldFont = draw_get_font();
var oldHalign = draw_get_halign();
draw_set_colour(c_black);
draw_rectangle( _x + 16, _y, _x + 240, _y + height * 8, false);
for (var i = 0; i < 28; i++) {
    draw_sprite(sprBorderBlock, 0, _x + 16 + i * 8, _y);  //Top border
    draw_sprite(sprBorderBlock, 0, _x + 16 + i * 8, _y + (height - 1) * 8);   //Bottom border
}
for (var i = 1; i < height - 1; i++) {
    draw_sprite(sprBorderBlock, 0, _x + 16, _y + i * 8);  //Left border
    draw_sprite(sprBorderBlock, 0, _x + 232, _y + i * 8);  //Right border
}
if phase == 1 {
    draw_sprite(sprCrown, (timer div 8) % 2, _x + 40, _y + 32);   //Crown
	if !audio_is_playing(sfxAchievement) draw_sprite(sprAchievementArrowDown, (arrowTimer % 30 < 15), _x + 128, _y + 64); //Arrow
    draw_set_colour(c_white);
    draw_set_font(global.MM3font);
    draw_set_halign(fa_left);
    draw_text(_x + 48, _y + 32, string_hash_to_newline(" \"" + string_upper(txt) + "\""));
    draw_text(_x + 40, _y + 48, string_hash_to_newline("CHALLENGE COMPLETED!"));
}
draw_set_color(oldCol);
draw_set_font(oldFont);
draw_set_halign(oldHalign);

