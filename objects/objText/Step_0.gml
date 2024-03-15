if is_string(phrase) {
    if alarm[3] <= 0 && pos >= string_length(phrase) - 1 {
        alarm[3] = page_delay;
    }
    if allow_fast_forward && alarm[1] > 0 && pos < string_length(phrase) - 1 && (global.keyJump || global.keyShoot || keyboard_check(vk_pagedown)) {
        pos++;
    }
    else if allow_manual_page_turn && pos >= string_length(phrase) - 1 && ds_queue_size(phrases) > 0 && (global.keyJumpPressed || global.keyShootPressed || keyboard_check_pressed(vk_pagedown) || global.keyPausePressed || keyboard_check_pressed(vk_end)) {
        phrase = ds_queue_dequeue(phrases);
        pos = -1;
        alarm[1] = delay;
    }
    else if delay == 0 || (allow_jump_to_end && alarm[1] > 0 && pos < string_length(phrase) - 1 && (global.keyPausePressed || keyboard_check_pressed(vk_end))) {
        pos = string_length(phrase) - 1;
    }
}


