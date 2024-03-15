//Creation code (all optional):
//col = <number> (0 = red (default); 1 = blue; 2 = red with orange eyes)

//NOTE: Big Eye actually telegraphs if he's going to do a low or high jump in this game
//If he's going to do a high jump, his eye will close
//If he's going to do a low jump, his eye will stay open

event_inherited();

image_xscale = -2;
image_yscale = 2;

healthpointsStart = 28;
healthpoints = healthpointsStart;
contactDamage = 2;

damage[objMetalBlade] = 2;

damage[objPharaohShot] = 2;
damage[objPharaohShotCharging] = 4;
damage[objPharaohShotCharged] = 4;

damage[objStarCrash] = 2;

damage[objSilverTomahawk] = 2;

damage[objWindStorm] = 2;

damage[objCentaurFlash] = 1;

//Enemy specific code
col = 1; //0 = red; 1 = blue; 2 = red with orange eyes

moveTimer = 0;
xspeed = 0;
yspeed = 0;
repeatAmount = 0;
repeatIsHigh = true;
ground = true;
image_speed = 0;
image_index = 0;
prevGround = true;

poseImgSpeed = 3/60;

alarm[0] = 1;

