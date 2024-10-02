event_inherited();

if !global.frozen and !dead {
    switch phase {
        case 0: //Waiting to appear
            //Timer
            timer += update_rate;
            if timer >= startup {
                timer = 0;
                phase = 1;
                
                image_index = 0;
                
                //while place_meeting(x, y, prtPlayer) {
                //    with prtPlayer y -= 1; //If the Yoku Block spawns "inside" Mega Man, push Mega Man upwards'. This way, it's much more fair
                //    with prtPlayer ground = true;
                //}
				if place_meeting(x, y, prtPlayer) {
					with prtPlayer {
						if !ground && mask_get_ycenter() < sprite_get_ycenter_object(other) {
							var _pushed = false;
							while place_meeting(x, y, other) {
								y -= 1; //If the Yoku Block spawns "inside" Mega Man, push Mega Man upwards'. This way, it's much more fair
								ground = true;
								_pushed = true;
							}
							if _pushed y = other.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
						}
						else {
							var _escaped = false;
							var _prevX = x;
							var _prevY = y;
							
							var amount = 1;
							while place_meeting(x, y, other.id) {
							    if !place_meeting(x-amount, y, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the left");
							        x -= amount;
							    }
							    else if !place_meeting(x+amount, y, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the right");
							        x += amount;
							    }
							    else if !place_meeting(x, y-amount, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel up");
							        y -= amount;
							    }
							    else if !place_meeting(x, y+amount, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel down");
							        y += amount;
							    }
							    else {
							        amount++;
							    }
								pushedBySpawnedSolid = true;
							}
							
							instance_deactivate_object(other.id);
				            var movingPltfm, meetingPlatform;
				            movingPltfm = collision_rectangle(bbox_left+2, bbox_top+2 - ((isSlide or isStun) * 2), bbox_right-2, bbox_bottom-2 + ((isSlide or isStun) * 2), prtMovingPlatformSolid, false, false);
                
				            meetingPlatform = false;
				            if movingPltfm >= 0
				            {
				                if movingPltfm.dead == false
				                    meetingPlatform = true;
				            }
                
				            if collision_rectangle(bbox_left+2, bbox_top+2 - ((isSlide or isStun) * 2), bbox_right-2, bbox_bottom + ((isSlide or isStun) * 2), objSolid, false, false)
				            || meetingPlatform == true
				                global._health = 0;
				            instance_activate_object(other.id);
							
							if x != _prevX || y != _prevY _escaped = true;
							if place_meeting(x, y+1, other.id) && _escaped {
								ground = true;
								y = other.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
							}
						}
					}
				}
				
                
                if insideView() {
                    playSFX(sfxYokuBlock);
                    visible = true;
                    mySolid = instance_create(x, y, objSolid);
                }
            }
        break;
        
        case 1: //Active
            //Animation
            if image_index < image_number-1
                image_speed = 0.25 * update_rate;
            else
            {
                image_speed = 0;
                image_index = image_number-1;
            }
            
            //Timer
            timer += update_rate;
            if timer >= active {
                timer = 0;
                phase = 2;
                visible = false;
                image_index = 0;
                
                if instance_exists(mySolid)
                    with mySolid instance_destroy();
            }
        break;
        
        case 2: //Waiting to reappear after disappearing
            //Timer
            timer += update_rate;
            if timer >= wait {
                timer = 0;
                phase = 1;
                    
                image_index = 0;
                
                //while place_meeting(x, y, prtPlayer)
                //{
                //    with prtPlayer y -= 1; //If the Yoku Block spawns "inside" Mega Man, push Mega Man upwards'. This way, it's much more fair
                //    with prtPlayer ground = true;
                //}
				if place_meeting(x, y, prtPlayer) {
					with prtPlayer {
						if !ground && mask_get_ycenter() < sprite_get_ycenter_object(other.id) {
							var _pushed = false;
							while place_meeting(x, y, other.id) {
								y -= 1; //If the Yoku Block spawns "inside" Mega Man, push Mega Man upwards'. This way, it's much more fair
								ground = true;
								_pushed = true;
							}
							if _pushed y = other.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
						}
						else {
							var _escaped = false;
							var _prevX = x;
							var _prevY = y;
							
							var amount = 1;
							while place_meeting(x, y, other.id) {
							    if !place_meeting(x-amount, y, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the left");
							        x -= amount;
							    }
							    else if !place_meeting(x+amount, y, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the right");
							        x += amount;
							    }
							    else if !place_meeting(x, y-amount, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel up");
							        y -= amount;
							    }
							    else if !place_meeting(x, y+amount, other.id) {
							        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel down");
							        y += amount;
							    }
							    else {
							        amount++;
							    }
								pushedBySpawnedSolid = true;
							}
							
							instance_deactivate_object(other.id);
				            var movingPltfm, meetingPlatform;
				            movingPltfm = collision_rectangle(bbox_left+2, bbox_top+2 - ((isSlide or isStun) * 2), bbox_right-2, bbox_bottom-2 + ((isSlide or isStun) * 2), prtMovingPlatformSolid, false, false);
                
				            meetingPlatform = false;
				            if movingPltfm >= 0
				            {
				                if movingPltfm.dead == false
				                    meetingPlatform = true;
				            }
                
				            if collision_rectangle(bbox_left+2, bbox_top+2 - ((isSlide or isStun) * 2), bbox_right-2, bbox_bottom + ((isSlide or isStun) * 2), objSolid, false, false)
				            || meetingPlatform == true
				                global._health = 0;
				            instance_activate_object(other.id);
							
							if x != _prevX || y != _prevY _escaped = true;
							if place_meeting(x, y+1, other.id) && _escaped {
								ground = true;
								y = other.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
							}
						}
					}
				}
                
                if insideView()
                {
                    playSFX(sfxYokuBlock);
                    visible = true;
                    mySolid = instance_create(x, y, objSolid);
                }
            }
        break;
    }
}
else
{
    image_speed = 0;
}

