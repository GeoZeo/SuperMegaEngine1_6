//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)
//dir = "hor"/"ver" ("hor" = horizontal (default); "ver" = vertical)
//startDir = -1/1 (1 makes the suzi move right/down first (default); -1 makes the suzi move left/up first)

event_inherited();

healthpointsStart = 5;
healthpoints = healthpointsStart;
contactDamage = 4;

damage[objPharaohShot] = 2;
damage[objPharaohShotCharging] = 2;
damage[objPharaohShotCharged] = 4;

damage[objStarCrash] = 5;

damage[objSilverTomahawk] = 2;
damage[objWindStorm] = 3;

//Enemy specific code
col = 0; //0 = red; 1 = orange; 2 = blue
    
dir = "hor";
    
startDir = 1;

moveTimer = 0;
moving = false;
xspeed = 0;
yspeed = 0;
image_speed = 0;
image_index = 0;


alarm[0] = 1;

