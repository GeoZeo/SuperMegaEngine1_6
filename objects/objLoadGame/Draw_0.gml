draw_set_valign(fa_top);
draw_set_font(global.font);
var margin = 30;
var top = 30;

if !surePhase {
	for (var i = 1; i < num_saves + 1; i++) {
	    if selected == i {
	        draw_set_colour(c_white);
	        drawSave(i - 1, saves[i - 1], selected == i);
			if row == 0 {
		        draw_sprite(sprPassCursorTopLeft, 0, margin + 49 + (i-1) * 16, top);
				draw_sprite(sprPassCursorTopRight, 0, (margin + 49 + (i-1) * 16) + 7, top);
				draw_sprite(sprPassCursorBottomLeft, 0, margin + 49 + (i-1) * 16, top + 7);
				draw_sprite(sprPassCursorBottomRight, 0, (margin + 49 + (i-1) * 16) + 7, top + 7);
			}
	    }
	    else if primed_index == i {
	        draw_set_colour(c_white);
	    }
		else {
			draw_set_colour(c_gray)
		}
	    draw_set_halign(fa_right);
	    draw_text(room_width - margin - (((num_saves * 16) - 7) - (i-1) * 16), top + 3, string_hash_to_newline(string(i)));
	}
	for (var i = 0; i < array_length_1d(actions); i++) {
		if action_index == i {
			draw_set_color(c_white);
			if row == 1 {
				draw_sprite(sprPassCursorTopLeft, 0, margin + 9 + i * 48, top + 16);
				draw_sprite(sprPassCursorTopRight, 0, (margin + 9 + i * 48) + 31, top + 16);
				draw_sprite(sprPassCursorBottomLeft, 0, margin + 9 + i * 48, top + 16 + 7);
				draw_sprite(sprPassCursorBottomRight, 0, (margin + 9 + i * 48) + 31, top + 16 + 7);
			}
		}
		else {
	        draw_set_colour(c_gray);
	    }
		draw_set_halign(fa_left);
	    draw_text(margin + 11 + i * 48, top + 19, string_hash_to_newline(actions[i]));
	}
	if selected == 0 {
	    draw_set_colour(c_white);
		if row == 0 {
			draw_sprite(sprPassCursorTopLeft, 0, margin + 1, top);
			draw_sprite(sprPassCursorTopRight, 0, margin + 32, top);
			draw_sprite(sprPassCursorBottomLeft, 0, margin + 1, top + 7);
			draw_sprite(sprPassCursorBottomRight, 0, margin + 32, top + 7);
		}
	}
	else {
	    draw_set_colour(c_gray);
	}

	//draw_set_halign(fa_center);
	//draw_text(room_width / 2, room_height - 40, "BACK");

	draw_set_halign(fa_left);
	draw_text(margin + 3, top + 3, string_hash_to_newline("BACK"));
}
else {
	for (var i = 1; i < num_saves + 1; i++) {
	    if selected == i {
	        draw_set_colour(c_white);
	        drawSave(i - 1, saves[i - 1], selected == i);
	    }
	}
	
	draw_set_halign(fa_center);
	draw_set_colour(c_white);
	var _action = "";
	switch(action_index) {
		case 0: _action = "LOAD"; break;
		case 2: _action = "OVERWRITE"; break;
		case 3: _action = "DELETE"; break;
	}
	draw_text(round(room_width / 2), top + 3, string_hash_to_newline(_action + " FILE " + string(selected) + "?"));
	
	draw_set_halign(fa_left);
	
	draw_sprite(sprPassCursorTopLeft, 0, margin + 32 + (!isSure * 112), top + 16);
	draw_sprite(sprPassCursorTopRight, 0, margin + (47 + (isSure * 8)) + (!isSure * 112), top + 16);
	draw_sprite(sprPassCursorBottomLeft, 0, margin + 32 + (!isSure * 112), top + 16 + 7);
	draw_sprite(sprPassCursorBottomRight, 0, margin + (47 + (isSure * 8)) + (!isSure * 112), top + 16 + 7);
	
	if isSure draw_set_colour(c_white); else draw_set_colour(c_gray);
	draw_text(margin + 34, top + 19, string_hash_to_newline("YES"));
	if !isSure draw_set_colour(c_white); else draw_set_colour(c_gray);
	draw_text(room_width - margin - 50, top + 19, string_hash_to_newline("NO"));
}

