if is_string(phrase) {
    var txt = string_upper(string_copy(phrase, 0, pos + 1));// + string_repeat("_", string_length(text) - pos - 1);
    draw_text_ext(x, y, string_hash_to_newline(txt), line_spacing, __view_get( e__VW.WView, 0 ) - 2 * x);
    
    if alarm[2] > arrow_delay / 2 && pos >= string_length(phrase) - 1 && ds_queue_size(phrases) > 0 {
        draw_sprite_ext(sprPassArrow, 0, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 4, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 1, 1, 1, -90, c_white, 1);
    }
}

