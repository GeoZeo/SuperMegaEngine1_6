//Initialize
names = split(nameList, ">");
name = ds_queue_dequeue(names);
phrases = split(text, ">");
phrase = ds_queue_dequeue(phrases);
if name_concat { phrase = name + string_repeat(":" + string_repeat(" ", name_line_breaks <= 0) + string_repeat("\n", name_line_breaks), string_length(name) > 0) + phrase; }
oldName = name;
delay = delay_normal;
scroll_speed_current = scroll_speed_default;
if delay > 0 alpha = 1;
alarm[1] = delay;
//alarm[2] = arrow_delay;

