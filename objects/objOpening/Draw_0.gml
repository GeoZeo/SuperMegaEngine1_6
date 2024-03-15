switch current_scene {
    case 0:
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(room_width / 2, room_height / 2, string_hash_to_newline("YEAR 20XX"));
    break;
    case 1:
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);    
    break;
}

