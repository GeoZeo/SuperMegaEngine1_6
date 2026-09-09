/// @description  Show
sprite_index = sprWilyCapsule4;
alarm[1] = (2 / room_speed) * room_speed;
image_blend = c_white;
__background_set_colour( c_white );
isFlash = true;
var shootID = instance_create(centerX, centerY, objWilyCapsuleShot);
shootID.player_x = player_x;
shootID.player_y = player_y;

