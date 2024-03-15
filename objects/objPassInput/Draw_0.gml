var xx = 78;
var yy = 174;

draw_set_colour(c_white);
draw_set_font(global.MM3font);
draw_set_halign(fa_left);
draw_text(xx + 10, yy, string_hash_to_newline("INPUT PASSWORD"));
draw_set_halign(fa_center);
draw_text(room_width / 2 + 11, yy + 16, string_hash_to_newline("FIRE: PUT - SELECT: COLOR"));
draw_text(room_width / 2 + 11, yy + 26, string_hash_to_newline("JUMP: BACK - START: END"));

var posx = 21;
var posy = 17;
var size = 16;
var offset = 3;

draw_password(password);

//Password cursor
draw_sprite(sprPassCursor, 0, posx + col * size + offset, posy + row * size + offset);

//Selected color
draw_sprite(sprPassCursor, 0, posx + (11 + (1 - color)) * size + offset - 2, posy + 1.5 * size + offset + 2);

