switch current_scene {
    case 0:
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(round(room_width / 2), round(room_height / 2), string_hash_to_newline("THE YEAR 20XX..."));
    break;
    case 1:
		draw_set_halign(fa_left);
		if __background_get(e__BG.Blend, 1) != c_black {
	        draw_set_valign(fa_top);    
		}
		else {
			draw_set_valign(fa_middle);
		}
    break;
	case 2:
	    draw_set_valign(fa_top);   
	break;
}

