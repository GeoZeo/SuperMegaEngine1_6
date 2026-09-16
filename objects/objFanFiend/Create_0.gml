event_inherited();

dir = -1;   //-1 = left, 1 = right
image_xscale = -dir;
image_speed = 0.25;
windXspeed = dir * 1;
windYspeed = 0;
wind = instance_create(x, y, objWind);
wind.xspeed = windXspeed;
wind.yspeed = windYspeed;

healthpointsStart = 5;
healthpoints = healthpointsStart;
contactDamage = 6;
hitWhite = true;
flashTime = 0.5;
instantItemSpawn = true;

damage[objPharaohShotCharged] = 3;

damage[objWindStorm] = 0;


