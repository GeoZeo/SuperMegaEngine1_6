draw_sprite(sprLogo, 0, round(room_width / 2), round(room_height / 2) - 55);


var oldCol;
oldCol = draw_get_color();
draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

draw_text(round(room_width/2), room_height-30, string_hash_to_newline("OPEN SOURCE SOFTWARE#MAINTAINED BY THE MEGA MAN FANDOM"));

if drawText {
    var text = "PRESS ";
    if global.GP > -1 {
        text += string_upper(button_to_string(global.pauseButton));
    }
    else {
        text += string_upper(key_to_string(global.pauseKey));
    }
    draw_text(round(room_width/2), 125, string_hash_to_newline(text));
}


draw_set_color(oldCol);
draw_set_halign(fa_left);

