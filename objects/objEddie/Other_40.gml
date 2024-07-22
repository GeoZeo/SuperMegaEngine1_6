if sprite_index == sprEddie or ((leaving or (bbox_top >= __view_get( e__VW.YView, 0 ) + (__view_get( e__VW.HView, 0 )) and yspeed > 0)) and sprite_index == sprRushTeleport and floor(image_index) == 0) {
    instance_destroy();
}

