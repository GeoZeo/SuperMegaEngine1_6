event_inherited();

dir = 1;
spd = 1.703125;

if image_xscale >= 0
	ang = 22.5;
else
	ang = 157.5;
	
turningSpd = 12.96875;

xspeed = cos(degtorad(ang)) * spd;
yspeed = -sin(degtorad(ang)) * spd;

img_speed = 30 / room_speed;

passThrough = true;
destroyOnReflect = true;
explosionEffect = true;

chaseTimer = 0;
chaseTime = 20;
targetLocked = false;

target = -1;    //Current target being chased
item = -1;  //Current item being carried
