if sprite_index == sprEddie or ((leaving or (bbox_top >= global.viewY + (global.viewHeight) and yspeed > 0)) and sprite_index == sprRushTeleport and floor(image_index) == 0) {
    instance_destroy();
}

