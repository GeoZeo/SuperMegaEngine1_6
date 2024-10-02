draw_sprite(sprPlayerSelect, char, 0, 16);

draw_set_font(global.MM3font);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(global.viewWidth / 2, 140, string_hash_to_newline(string_upper(global.name)));

alpha += 1 / 60;
if (alpha > 1) alpha = 0;

draw_sprite_ext(sprPassArrow, 0, global.viewWidth / 4, 142, -1, 1, 0, c_red, round(alpha));
draw_sprite_ext(sprPassArrow, 0, 3 * global.viewWidth / 4, 142, 1, 1, 0, c_red, round(alpha));

draw_text(global.viewWidth / 2, 201, string_hash_to_newline("PRESS START TO SELECT"));

