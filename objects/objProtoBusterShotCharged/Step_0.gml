event_inherited();

if image_index > 1 and instance_exists(prtPlayer) {
    xspeed = 6.5 * dir;
}

if xspeed != 0 and image_index < 3 {
    image_index = 3;
}

