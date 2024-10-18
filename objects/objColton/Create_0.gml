event_inherited();

image_xscale = -1;

healthpointsStart = 6;
healthpoints = healthpointsStart;
contactDamage = 4;

damage[objPharaohShot] = 2;
damage[objPharaohShotCharging] = 2;
damage[objPharaohShotCharged] = 6;

damage[objStarCrash] = 6;

damage[objSilverTomahawk] = 2;

damage[objWindStorm] = 2;

//Enemy specific code
shooting = false;
animTimer = 0;
bulletID = -10;
image_speed = 0;
image_index = 0;

if x >= player_x
    image_xscale = -1;
else
    image_xscale = 1;

