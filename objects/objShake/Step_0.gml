event_inherited();

if !global.frozen && insideView() {
	
	var shake_x = 0;
	var shake_y = 0;
	
	if x_is_randomised {
		randomize();
	    shake_x = round(random_range(shake_amount_left, shake_amount_right));
		while shake_x == prev_shake_x {
			if (shake_amount_left == 0 and shake_amount_right == 0)
			|| (shake_amount_left == shake_amount_right && prev_shake_x != 0) {
				shake_x = 0;
				break;
			}
			randomize();
			shake_x = round(random_range(shake_amount_left, shake_amount_right));
		}
	}
	else {
		if left_start && !right_start {
			shake_x = shake_amount_left;
			left_start = false;
			right_start = false;
		}
		else if right_start && !left_start {
			shake_x = shake_amount_right;
			left_start = false;
			right_start = false;
		}
		else {
			if prev_shake_x == shake_amount_left {
				shake_x = shake_amount_right;
			}
			else if prev_shake_x == shake_amount_right {
				shake_x = shake_amount_left;
			}
			left_start = false;
			right_start = false;
		}
	}
	prev_shake_x = shake_x;
	
	if y_is_randomised {
		randomize();
	    shake_y = round(random_range(shake_amount_up, shake_amount_down));
		while shake_y == prev_shake_y {
			if (shake_amount_up == 0 and shake_amount_down == 0)
			|| (shake_amount_up == shake_amount_down && prev_shake_y != 0) {
				shake_y = 0;
				break;
			}
			randomize();
			shake_y = round(random_range(shake_amount_up, shake_amount_down));
		}
	}
	else {
		if up_start && !down_start {
			shake_y = shake_amount_up;
			up_start = false;
			down_start = false;
		}
		else if down_start && !up_start {
			shake_y = shake_amount_down;
			up_start = false;
			down_start = false;
		}
		else {
			if prev_shake_y == shake_amount_up {
				shake_y = shake_amount_down;
			}
			else if prev_shake_y == shake_amount_down {
				shake_y = shake_amount_up;
			}
			up_start = false;
			down_start = false;
		}
	}
	prev_shake_y = shake_y;
	
	global.shakeX = shake_x;
	global.shakeY = shake_y;
	
	if alarm[0] > ((shake_duration - stun_window) * room_speed) {
		with prtPlayer {
			if ground && bbox_bottom > other.y-1
				playerStun((other.shake_duration * room_speed), false);
		}
	}
}
else if global.frozen {
	if alarm[0] > 0
		alarm[0]++;
}

