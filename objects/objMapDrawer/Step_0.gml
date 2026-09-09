var size = array_length_1d(keys);
if step < size && canDraw {
    progress += draw_speed;
    if progress >= 1 {
        progress = 0;
        step++;
		if step >= size {
			drawPoint = true;
		}
    }
}

