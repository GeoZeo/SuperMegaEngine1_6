draw_text_ext(room_width / 2, y, string_hash_to_newline(string_upper(text)), 8, 240);

if y < scroll_threshold {
    draw_sprite(megamansprite, megaImg, megamanx, megamany);
    draw_sprite(jetsprite, round(jetx / 5) % 2, jetx, jety);
}

