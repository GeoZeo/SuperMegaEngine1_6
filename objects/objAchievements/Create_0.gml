topItem = 0;
selected = 0;
num_menu_items = instance_number(prtAchievement);
maxItems = min(8, num_menu_items);
finished = false;
timer = 0;
completed = 0;
for (var i = 0; i < num_menu_items; i++) {
    var achievement = instance_find(prtAchievement, i);
    if achievement.completed {
        completed++;
    }
}

draw_set_font(global.MM3font);
draw_set_color(c_white);
draw_set_halign(fa_left);

//For auto-shifting through the options in the menu
as_delay = 25;
as_rate = 5;
as_init_timer = as_delay;
as_timer = as_rate;

