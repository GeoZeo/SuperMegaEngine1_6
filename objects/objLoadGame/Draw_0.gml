draw_set_valign(fa_top);
draw_set_font(global.font);
var margin = 30;
var top = 30;

for (var i = 0; i < num_saves; i++) {
    if selected == i {
        draw_set_colour(c_white);
        drawSave(i, saves[i], selected == i);
        draw_sprite(sprPassCursor, 0, margin + 1 + i * 16, top);
    }
    else {
        draw_set_colour(c_gray);
    }
    draw_set_halign(fa_left);
    draw_text(margin + 3 + i * 16, top + 3, string_hash_to_newline(string(i)));
}

if selected == num_saves {
    draw_set_colour(c_white);
}
else {
    draw_set_colour(c_gray);
}

//draw_set_halign(fa_center);
//draw_text(room_width / 2, room_height - 40, "BACK");

draw_set_halign(fa_right);
draw_text(room_width - margin, top + 3, string_hash_to_newline("BACK"));

