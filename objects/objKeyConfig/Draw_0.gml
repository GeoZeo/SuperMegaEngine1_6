draw_set_halign(fa_center);

draw_text(room_width / 2, 30, string_hash_to_newline("KEY CONFIG"));

var initial_y = 50;
var vspace = 12;
var left = 48;

draw_set_halign(fa_left);

for (var i = 0; i < num_menu_items; i++) {
    if i == num_menu_items - 2 {
        draw_set_halign(fa_center);
		if !confirmedPhase {
	        if !surePhase
				draw_text(room_width / 2 + 1, i * vspace + initial_y, string_hash_to_newline(menu[i]));
			else
				draw_text(room_width / 2 + 1, i * vspace + initial_y, string_hash_to_newline("RESET TO DEFAULTS?"));
		}
	}
	else if i == num_menu_items - 1 {
		if !confirmedPhase {
	        if !surePhase {
				draw_set_halign(fa_center);
				draw_text(room_width / 2, i * vspace + initial_y, string_hash_to_newline(menu[i]));
			}
			else {
				draw_set_halign(fa_left);
				draw_text(left + 33, i * vspace + initial_y, string_hash_to_newline("YES"));
				draw_text(left + 33 + 80, i * vspace + initial_y, string_hash_to_newline("NO"));
			}
		}
		else {
			draw_set_halign(fa_center);
			draw_text(room_width / 2 + 2, i * vspace + initial_y, "BINDINGS RESET.");
		}
	}
    else {
        draw_text(left, i * vspace + initial_y, string_hash_to_newline(menu[i]));
        if waiting and i == selected {
            if ((timer % 30 >= 15) % 2) == 0 draw_text(room_width / 2 + left - 16, i * vspace + initial_y, string_hash_to_newline("PRESS"));
        }
        else {
            draw_text(room_width / 2 + left - 16, i * vspace + initial_y, string_hash_to_newline(string_upper(key_to_string(key[i]))));
        }
    }
}

if !confirmedPhase {
	if !surePhase {
		if selected >= num_menu_items - 2 {
		    draw_sprite(sprPassArrow, ((timer % 30 >= 15) % 2) * !waiting, room_width / 2 - 24, selected * vspace + initial_y + 2);
		}
		else {
		    draw_sprite(sprPassArrow, ((timer % 30 >= 15) % 2) * !waiting, left - 10, selected * vspace + initial_y + 2);
		}
	}
	else {
		draw_sprite(sprPassArrow, ((timer % 30 >= 15) % 2) * !waiting, (left + 21) + (!isSure * 80), (num_menu_items - 1) * vspace + initial_y + 2);
	}
}

