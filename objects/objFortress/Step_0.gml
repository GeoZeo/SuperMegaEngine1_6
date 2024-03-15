if (alarm[1] > 0 && floor(alarm[1] / 2) % 2 == 0) || (alarm[3] > 0 && floor(alarm[3] / 2) % 2 == 0) {
    __background_set_colour( c_white );
}
else {
    __background_set_colour( c_black );
}

if alarm[6] == -1 && instance_exists(objMapDrawer) {
    alarm[6] = time_to_start;
    with objMapDrawer {
        if draw_speed > 0 && step < ds_list_size(lines) {
            other.alarm[6] = -1;
        }
    }
}

