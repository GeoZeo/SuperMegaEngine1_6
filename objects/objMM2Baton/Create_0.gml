//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)
//dir = "hor"/"ver" ("hor" = horizontal (default); "ver" = vertical)
//startDir = -1/1 (1 makes the suzi move right/down first (default); -1 makes the suzi move left/up first)

event_inherited();

image_xscale = -1;

healthpointsStart = 2;
healthpoints = healthpointsStart;
contactDamage = 4;
reflectProjectiles = true;

damage[objMetalBlade] = 2;

damage[objPharaohShotCharged] = 4;
damage[objPharaohShotCharging] = 2;

damage[objSilverTomahawk] = 2;

damage[objWindStorm] = 2;

//Enemy specific code
moveTimer = 0;
moving = false;
retreating = false;
xspeed = 0;
yspeed = 0;
image_speed = 0;
image_index = 0;

counter = 0;

move_speed = 0.5;

