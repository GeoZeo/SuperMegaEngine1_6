if !global.frozen {
	
	var _oldActive = instance_exists(objYellowDevil);
	if !_oldActive instance_activate_object(objYellowDevil);
	if instance_exists(prtPlayer) {
		with objYellowDevil {
			player_x = prtPlayer.x;
			player_y = prtPlayer.y;
		}
	}
	if !_oldActive instance_deactivate_object(objYellowDevil);
	
    switch current_state {
        case block_states.FIT:
            hspeed = 0;
            if image_index >= 2 {
                image_index = 1.9;
            }
            else {
                image_index -= 0.1;
            }
            if image_index <= 0 {
                image_index = 0;
                image_xscale *= -1;
                current_state = block_states.IDLE;
                //alarm[0] = room_speed * (19 * delay + 1); 
                mustOpen = true;
                with objYellowDevilBlock {
                    if current_state != block_states.IDLE {
                        other.mustOpen = false;
                    }
                }
                if mustOpen {
                    instance_activate_object(objYellowDevil);
                }                    
            }
        break;
        case block_states.UNFIT:
            image_index += 0.1;
            if image_index >= 2 {
                current_state = block_states.MOVING;
            }
        break;
        case block_states.MOVING:
            image_index += 0.1;
            if image_index >= 5 {
                image_index = 2;
            }
            hspeed = image_xscale * spd;
            if image_xscale == -1 && x + sprite_xoffset <= global.viewX + xpos {
                current_state = block_states.FIT;
                x = global.viewX + xpos - sprite_xoffset;
            }
            else if image_xscale == 1 && x - sprite_xoffset + sprite_width >= global.viewX + global.viewWidth - xpos {
                current_state = block_states.FIT;
                x = global.viewX + global.viewWidth - xpos + sprite_xoffset - sprite_width;
            }
        break;
        case block_states.IDLE:   
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
    hspeed = 0;
    image_speed = 0;
}

