draw_set_halign(fa_left);
for (var i = topItem; i < topItem + maxItems; i++) {
    var height = i - topItem;
    var achievement = instance_find(prtAchievement, i);
    draw_text(40, 32 + height * 16, string_hash_to_newline(string_lpad(string(i + 1), 2, "0")));
    if achievement.completed {
        draw_sprite(sprCrown, 0, 56, 32 + height * 16);
    }
    draw_text(68, 32 + height * 16, string_hash_to_newline(achievement.achName));
    if i == selected {
        draw_sprite(sprPassArrow, (timer div 4) % 2, 32, 34 + height * 16);
        draw_text(32, global.viewHeight - 48, string_hash_to_newline(string_break(achievement.description, 25)));
    }
}
draw_set_halign(fa_right);
draw_text(global.viewWidth - 32, 32, string_hash_to_newline(string(floor(completed / num_menu_items * 100)) + "%"));

