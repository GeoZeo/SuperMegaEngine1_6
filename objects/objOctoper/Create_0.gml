event_inherited();

healthpointsStart = 20;
healthpoints = healthpointsStart;

playerCanTouch = false;
projCanTouch = false;
shieldCanTouch = false;

contactDamage = 4;

xspeed = image_xscale * 0.25;
yspeed = -1;

depth = 10000000;

useHitBox = true;
hitbox_left = 16;
hitbox_right = 54;
hitbox_top = -21;
hitbox_bottom = 1;

damage[objWindStorm] = 2;

explosionTime = 18;
explosionTimer = 0;
explosionMax = 5;
explosionCounter = 0;

hitWhite = true;

//Boss-specific code
sprite_index = sprOctoperFadeIn;
image_speed = 0;
spriteTimer = 0;
bounceCount = 0;
top = y - (sprite_height - 48);
bottom = y;


