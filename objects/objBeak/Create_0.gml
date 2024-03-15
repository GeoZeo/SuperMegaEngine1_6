//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)
//dir = -1/1 (1 = faces right (default); -1 = faces left)

event_inherited();

reflectProjectiles = true;

damage[objMetalBlade] = 2;

damage[objPharaohShot] = 2;
damage[objPharaohShotCharged] = 4;
damage[objPharaohShotCharging] = 4;

damage[objSilverTomahawk] = 2;

damage[objWindStorm] = 2;


//Enemy specific code
col = 0; //0 = red; 1 = orange; 2 = blue
    
dir = 1;

shootTimer = 0;
shooting = false;
image_speed = 0;
image_index = 0;


alarm[0] = 1;

