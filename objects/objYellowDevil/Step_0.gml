event_inherited();

if isFight && !global.frozen {
    if alarm[0] < 1 && instance_number(objYellowDevilBlock) == 0 {
        alarm[0] = room_speed;
    }
    switch current_state {
        case yd_states.CLOSED:
            //visible = false;
            //canHit = false;
            mustOpen = (instance_number(objYellowDevilBlock) == blocks);
            with objYellowDevilBlock {
                if other.alarm[2] > 0 || current_state != block_states.IDLE {
                    other.mustOpen = false;
                }
            }
            if mustOpen {
				var _offsetX, _offsetY;
				randomize();
				var location = choose(0, 1, 2, 3, 4, 5, 6, 7, 8);
				switch location {
					case 0: _offsetX = 0; _offsetY = 11; break;
					case 1: _offsetX = 10; _offsetY = 11; break;
					case 2: _offsetX = 8; _offsetY = 23; break;
					case 3: _offsetX = 1; _offsetY = 17; break;
					case 4: _offsetX = 8; _offsetY = 5; break;
					case 5: _offsetX = 5; _offsetY = 0; break;
					case 6: _offsetX = 2; _offsetY = 23; break;
					case 7: _offsetX = 9; _offsetY = 17; break;
					default: _offsetX = 2; _offsetY = 4; break;
				}
                if image_xscale == -1 {
                    x = global.viewX + global.viewWidth - 16 * 5 + 13 + 2 - _offsetX;
                }
                else {
                    x = global.viewX + 16 * 5 - 13 - 2 + _offsetX;
                }
                y = global.viewY + global.viewHeight - 16 * 9 - 7 - 2 + _offsetY;
                current_state = yd_states.OPENING;
                image_index = 2.8;
                if !depthFinalised depth--; depthFinalised = true;
                show_debug_message("OPENING");
            }
        break;
        case yd_states.OPENING:
            visible = true;
            image_index -= 0.2;
			if image_index <= 1 {
				if alarm[9] == -1 canHit = true;
				projCanTouch = true;
			}
            if image_index <= 0 {
				image_index = 0;
                current_state = yd_states.SHOOTING;
                show_debug_message("SHOOTING " + string(image_index) + " visible? " + string(visible));
            }
        break;
        case yd_states.SHOOTING:
            visible = true;
            if alarm[9] == -1 canHit = true;
            image_index = 0;
            if alarm[1] == -1 && !instance_exists(objYellowDevilBullet) {
				instance_create(x, y, objYellowDevilBullet);
				playSFX(sfxEnemyShootClassic);
                alarm[1] = room_speed * 1;
            }
        break;
        case yd_states.CLOSING:
            visible = true;
            if alarm[9] == -1 canHit = true;
            image_index += 0.2;
			if image_index >= 2 {
				canHit = false;
				projCanTouch = false;
			}
            if image_index >= 3 {
                show_debug_message("CLOSED");
                current_state = yd_states.CLOSED;
                image_xscale *= -1;
                y = global.viewY - 16;
                drawHitSpark = false;
                alarm[9] = -1;
                with objYellowDevilBlock {
                    if block_id == 0 {
                        alarm[0] = room_speed * delay;
                    }
                }
                instance_deactivate_object(self);
            }
        break;
    }
}
else {
    if alarm[0] > 0 {
        alarm[0]++;
    }
    if alarm[1] > 0 {
        alarm[1]++;
    }
    if alarm[2] > 0 {
        alarm[2]++;
    }
    image_speed = 0;
}

