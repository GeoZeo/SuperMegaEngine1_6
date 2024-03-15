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
                if image_xscale == -1 {
                    x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 16 * 5 + random(4) - 2;
                }
                else {
                    x = __view_get( e__VW.XView, 0 ) + 16 * 5 + random(4) - 2;
                }
                y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 16 * 9 + random(4) - 2;
                current_state = yd_states.OPENING;
                image_index = 2.9;
                depth--;
                show_debug_message("OPENING");
            }
        break;
        case yd_states.OPENING:
            visible = true;
            canHit = true;
            image_index -= 0.1;
            if image_index <= 0 {
                current_state = yd_states.SHOOTING;
                show_debug_message("SHOOTING " + string(image_index) + " visible? " + string(visible));
            }
        break;
        case yd_states.SHOOTING:
            visible = true;
            canHit = true;
            image_index = 0;
            if alarm[1] == -1 && !instance_exists(objYellowDevilBullet) {
                instance_create(x, y, objYellowDevilBullet);
                alarm[1] = room_speed * 1;
            }
        break;
        case yd_states.CLOSING:
            visible = true;
            canHit = true;
            image_index += 0.1;
            if image_index >= 3 {
                show_debug_message("CLOSED");
                current_state = yd_states.CLOSED;
                image_xscale *= -1;
                y = __view_get( e__VW.YView, 0 ) - 16;
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

