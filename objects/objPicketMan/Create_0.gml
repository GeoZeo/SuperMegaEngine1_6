//Creation code (all optional):

event_inherited();

image_xscale = -1;

healthpointsStart = 10;
healthpoints = healthpointsStart;
contactDamage = 3;
reflectProjectiles = true;

damage[objMetalBlade] = 2;

damage[objPharaohShotCharged] = 4;

damage[objStarCrash] = 4;

damage[objSilverTomahawk] = 2;

damage[objWindStorm] = 2;


//Enemy specific code
shootTimer = 0;
shooting = false;
shootAmount = 0;
randomize();
shootAmountMax = choose(5, 10);
xspeed = 0;
yspeed = 0;
image_speed = 0;
image_index = 0;

