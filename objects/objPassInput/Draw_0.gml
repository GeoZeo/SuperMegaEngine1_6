var oldCol = draw_get_color();
var oldFont = draw_get_font();
var oldHalign = draw_get_halign();

var xx = 78;
var yy = 174;

draw_set_colour(c_white);
draw_set_font(global.MM3font);
draw_set_halign(fa_left);
draw_text(xx + 10, yy, string_hash_to_newline("INPUT PASSWORD"));
draw_text(xx - 30, yy + 16, string_hash_to_newline("JUMP:  SET - SEL: COLOR"));
draw_text(xx - 30, yy + 26, string_hash_to_newline("FIRE: BACK - PAUSE: END"));

var posx = 21;
var posy = 17;
var size = 16;
var offset = 3;

draw_password(password);

//Password cursor
draw_sprite(sprPassCursorTopLeft, floor(cursorTimer), posx + col * size + offset, posy + row * size + offset);
draw_sprite(sprPassCursorTopRight, floor(cursorTimer), (posx + col * size + offset) + 7, posy + row * size + offset);
draw_sprite(sprPassCursorBottomLeft, floor(cursorTimer), posx + col * size + offset, (posy + row * size + offset) + 7);
draw_sprite(sprPassCursorBottomRight, floor(cursorTimer), (posx + col * size + offset) + 7, (posy + row * size + offset) + 7);

//Selected color
draw_sprite(sprPassCursorTopLeft, 0, posx + (11 + (1 - color)) * size + offset - 2, posy + 1.5 * size + offset + 2);
draw_sprite(sprPassCursorTopRight, 0, (posx + (11 + (1 - color)) * size + offset - 2) + 7, posy + 1.5 * size + offset + 2);
draw_sprite(sprPassCursorBottomLeft, 0, posx + (11 + (1 - color)) * size + offset - 2, (posy + 1.5 * size + offset + 2) + 7);
draw_sprite(sprPassCursorBottomRight, 0, (posx + (11 + (1 - color)) * size + offset - 2) + 7, (posy + 1.5 * size + offset + 2) + 7);

draw_set_color(oldCol);
draw_set_font(oldFont);
draw_set_halign(oldHalign);

