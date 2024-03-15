var size = ds_list_size(lines);
if step < size {
    progress += draw_speed;
    if progress >= 1 {
        progress = 0;
        step++;
    }
}

