if ds_queue_size(phrases) > 0 {
	if delay == 0 {
		increasingAlpha = false;
		alarm[2] = -1;
		
		var listDup = ds_queue_create();
		ds_queue_copy(listDup, names);
		alphaBypass = ds_queue_dequeue(listDup) == name
		ds_queue_destroy(listDup);
	}
	else {
		var listDup = ds_queue_create();
		ds_queue_copy(listDup, names);
		alphaBypass = ds_queue_dequeue(listDup) == name
		ds_queue_destroy(listDup);
		
		phrase = ds_queue_dequeue(phrases);
		name = ds_queue_dequeue(names);
		if name_concat && name != oldName { phrase = name + string_repeat(":" + string_repeat(" ", name_line_breaks <= 0) + string_repeat("\n", name_line_breaks), string_length(name) > 0) + phrase; }
		oldName = name;
		if delay == 0 {
			alarm[2] = arrow_delay;
			pos = string_length(phrase);
		}
		else {
			pos = 0;
		}
		alarm[1] = delay;
	}
}

