event_inherited();

spd = 0.5;

image_xscale = 1;
image_speed = 5 / room_speed;

explosionTime = 10;
explosionTimer = 0;
explosionMax = 2;
explosionCounter = 0;

dying = false;

useHitBox = true;
hitbox_left = 8;
hitbox_right = 32;
hitbox_top = 0;
hitbox_bottom = sprite_height - 8;

contactDamage = 6;

damage[objWindStorm] = 3;
damage[objTimeSlow] = 1;

