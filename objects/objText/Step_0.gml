if !instance_exists(objFadeIn) and !instance_exists(objFadeout) {
	
	drawStart = true;
	
	if is_string(phrase) {
		if increasingAlpha {
			alphaTimer += 1;

			if alphaTimer >= alphaTimerMax
			{
			    alpha += alphaChange;
			    alphaTimer = 0;
			}
			
			if alpha >= 1
			{
				alpha = 1;
			}
		}
		else {
			alphaTimer += 1;

			if alphaTimer >= alphaTimerMax
			{
			    alpha -= alphaChange;
			    alphaTimer = 0;
			}
			
			if alpha <= 0
			{
				alpha = 0;
				increasingAlpha = true;
				if ds_queue_size(phrases) > 0 {
					
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
		}
		
	    if alarm[3] <= 0 && pos >= string_length(phrase) && alpha >= 1 && increasingAlpha {
	        alarm[2] = arrow_delay;
			alarm[3] = page_delay;
			
			var listDup = ds_queue_create();
			ds_queue_copy(listDup, names);
			alphaBypass = ds_queue_dequeue(listDup) == name
			ds_queue_destroy(listDup);
	    }
		var _delay_delta = delay_normal - delay_fast;
	    if allow_fast_forward && alarm[1] > 0 && pos < string_length(phrase) && (global.keyJump || global.keyShoot || keyboard_check(vk_pagedown)) {
			if alarm[1] - _delay_delta > 0 && delay != delay_fast {
				alarm[1] -= _delay_delta;
			}
			delay = delay_fast;
	    }
	    else {
			scroll_speed_current = scroll_speed_default;
			if alarm[1] > 0 && delay != delay_normal {
				alarm[1] += _delay_delta;
			}
			delay = delay_normal;
			
			if allow_manual_page_turn && pos >= string_length(phrase) && ds_queue_size(phrases) > 0 && (global.keyJumpPressed || global.keyShootPressed || keyboard_check_pressed(vk_pagedown) || global.keyPausePressed || keyboard_check_pressed(vk_end)) {
				if delay == 0 {
					if increasingAlpha {
						alpha = 1;
						alarm[2] = -1;
						alarm[3] = -1;
						increasingAlpha = false;
						
						var listDup = ds_queue_create();
						ds_queue_copy(listDup, names);
						alphaBypass = ds_queue_dequeue(listDup) == name
						ds_queue_destroy(listDup);
					}
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
						if skip_scroll && allow_jump_to_end && alarm[1] <= 0 && (global.keyPausePressed || keyboard_check_pressed(vk_end)) {
							pos = string_length(phrase);
						}
						else {
							pos = 0;
						}
					}
			        alarm[1] = delay;
					alarm[3] = page_delay;
				}
		    }
		    else if delay == 0 || (allow_jump_to_end && alarm[1] > 0 && pos < string_length(phrase) && (global.keyPausePressed || keyboard_check_pressed(vk_end))) {
		        if pos < string_length(phrase)
					alarm[2] = arrow_delay;
				
				pos = string_length(phrase);
		    }
		}
	}
}
else {
	if alarm[1] > 0 {
		alarm[1]++;
	}
	if alarm[2] > 0 {
		alarm[2]++;
	}
	if alarm[3] > 0 {
		alarm[3]++;
	}
}


