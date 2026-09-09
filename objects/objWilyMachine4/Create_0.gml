event_inherited();

spd = 0.5;

image_xscale = 1;
image_speed = 3.5294117647 / room_speed;

healthBarPrimaryCol = make_color_rgb(255, 120, 255);
healthBarFlash = true;

explosionTime = 10;
explosionTimer = 0;
explosionMax = 2;
explosionCounter = 0;

hideSmoke = true;

useHitBox = true;
hitbox_left = 8;
hitbox_right = 32;
hitbox_top = 0;
hitbox_bottom = sprite_height - 8;
checkPlayerSpriteCenter = true;

contactDamage = 6;

damage[objWindStorm] = 3;
damage[objTimeSlow] = 1;

