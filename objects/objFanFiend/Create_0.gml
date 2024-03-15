event_inherited();

dir = -1;   //-1 = left, 1 = right
image_xscale = -dir;
image_speed = 0.2;
wind = instance_create(x, y, objWind);
wind.xspeed = dir;

healthpointsStart = 5;
healthpoints = healthpointsStart;
contactDamage = 6;

damage[objPharaohShotCharged] = 3;

damage[objWindStorm] = 0;


