//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)
event_inherited();

healthpointsStart = 3;
healthpoints = healthpointsStart;

damage[objPharaohShot] = 2;
damage[objPharaohShotCharging] = 2;
damage[objPharaohShotCharged] = 4;

damage[objStarCrash] = 2;

damage[objSilverTomahawk] = 3;

damage[objWindStorm] = 3;


//Enemy specific code
col = 0; //0 = red; 1 = orange; 2 = blue
player_distance = 0;

shootTimer = 0;
shooting = false;
shootAmount = 0;
animate = false;
animateTimer = 0;
image_xscale = 1;
image_speed = 0;
image_index = 0;

radius = 100;


alarm[0] = 1;

