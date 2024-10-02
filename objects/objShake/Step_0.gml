event_inherited();

if !global.frozen && insideView() {
    if total_shake_x == 0 || total_shake_y == 0 {
        alarm[0] = shake_duration * room_speed;
    }
	randomize();
    var shake_x = random_range(-shake_amount, shake_amount);
	while shake_x == prev_shake_x {
		randomize();
		shake_x = random_range(-shake_amount, shake_amount);
	}
	prev_shake_x = shake_x;
	
	randomize();
    var shake_y = random_range(-shake_amount, shake_amount);
	while shake_y == prev_shake_y {
		randomize();
		shake_y = random_range(-shake_amount, shake_amount);
	}
	prev_shake_y = shake_y;
	
    total_shake_x += shake_x;
    total_shake_y += shake_y;
	
	global.viewX += shake_x;
	global.viewY += shake_y;
	
	if alarm[0] > stun_window * room_speed {
		with prtPlayer {
			if ground && bbox_bottom > other.y-1
				playerStun((other.shake_duration * room_speed));
		}
	}
}
else if global.frozen {
	if alarm[0] > 0
		alarm[0]++;
}

