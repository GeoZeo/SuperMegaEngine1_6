draw_set_halign(fa_center);

draw_text(room_width / 2, 30, string_hash_to_newline("KEY CONFIG"));

var initial_y = 50;
var vspace = 12;
var left = 70;

draw_set_halign(fa_left);

for (var i = 0; i < num_menu_items; i++) {
    if i == num_menu_items - 2 {
        draw_set_halign(fa_center);
        if !surePhase
			draw_text(room_width / 2 + 1, i * vspace + initial_y, string_hash_to_newline(menu[i]));
		else
			draw_text(room_width / 2 + 1, i * vspace + initial_y, string_hash_to_newline("RESET TO DEFAULTS?"));
    }
	else if i == num_menu_items - 1 {
        if !surePhase {
			draw_set_halign(fa_center);
			draw_text(room_width / 2, i * vspace + initial_y, string_hash_to_newline(menu[i]));
		}
		else {
			draw_set_halign(fa_left);
			draw_text(left, i * vspace + initial_y, string_hash_to_newline("YES"));
			draw_text(room_width / 2 + 44, i * vspace + initial_y, string_hash_to_newline("NO"));
		}
	}
    else {
        draw_text(left, i * vspace + initial_y, string_hash_to_newline(menu[i]));
        if waiting and i == selected {
            draw_text(room_width / 2 + 20, i * vspace + initial_y, string_hash_to_newline("PRESS"));
        }
        else {
            draw_text(room_width / 2 + 20, i * vspace + initial_y, string_hash_to_newline(string_upper(key_to_string(key[i]))));
        }
    }
}

if !surePhase {
	if selected >= num_menu_items - 2 {
	    draw_sprite(sprPassArrow, 0, room_width / 2 - 24, selected * vspace + initial_y + 2);
	}
	else {
	    draw_sprite(sprPassArrow, 0, left - 10, selected * vspace + initial_y + 2);
	}
}
else {
	draw_sprite(sprPassArrow, 0, (left - 10) + (!isSure * 98), (num_menu_items - 1) * vspace + initial_y + 2);
}

