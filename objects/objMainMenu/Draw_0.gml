draw_set_halign(fa_center);

draw_text(room_width / 2, 30, string_hash_to_newline("GAME MENU"));

var initial_y = 60;
var vspace = 16;
var left = room_width / 3;

draw_set_halign(fa_left);

for (var i = 0; i < num_menu_items; i++) {
    draw_text(left, i * vspace + initial_y, string_hash_to_newline(menu[i]));
}

draw_sprite(sprPassArrow, 0, left - 10, selected * vspace + initial_y + 2);

