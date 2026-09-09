if allow_fast_forward && pos < string_length(phrase) && (global.keyJump || global.keyShoot || keyboard_check(vk_pagedown)) {
	if scroll_speed_current < scroll_speed_max {
		scroll_speed_current += scroll_accel;
		if scroll_speed_current >= scroll_speed_max {
			scroll_speed_current = scroll_speed_max;
		}
	}
}
else {
	scroll_speed_current = scroll_speed_default;
}
pos += scroll_speed_current;
if pos < string_length(phrase) {
    alarm[1] = delay;
}
else {
	alarm[2] = arrow_delay;
}

