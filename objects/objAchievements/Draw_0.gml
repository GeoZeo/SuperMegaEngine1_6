draw_set_halign(fa_left);
for (var i = topItem; i < topItem + maxItems; i++) {
    var height = i - topItem;
    var achievement = instance_find(prtAchievement, i);
    draw_text(40, 32 + height * 16, string_hash_to_newline(string_lpad(string(i + 1), 2, "0")));
    if achievement.completed {
        draw_sprite(sprCrown, (timer div 8) % 2, 56, 32 + height * 16);
    }
    draw_text(68, 32 + height * 16, string_hash_to_newline(achievement.achName));
    if i == selected {
        draw_sprite(sprPassArrow, (timer % 30 >= 15) % 2, 32, 34 + height * 16);
        draw_text(32, global.viewHeight - 64, string_hash_to_newline(string_break(achievement.description, 25)));
    }
}
draw_set_halign(fa_center);
draw_text(global.viewX + global.viewWidth / 2, 16, string_hash_to_newline(string(floor(completed / num_menu_items * 100)) + "%"));

if num_menu_items > maxItems {
	draw_set_halign(fa_right);
	if topItem + (maxItems - 1) < num_menu_items - 1 {
		draw_sprite(sprAchievementArrowDown, (timer2 % 30 >= 15) % 2, global.viewWidth - 32, global.viewHeight - 80);
	}
	if topItem > 0 {
		draw_sprite(sprAchievementArrowUp, (timer2 % 30 >= 15) % 2, global.viewWidth - 32, 36);
	}
}

