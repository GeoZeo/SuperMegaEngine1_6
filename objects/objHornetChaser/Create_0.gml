event_inherited();

spd = 1.703125;

xspeed = spd;
yspeed = -(spd/2);

img_speed = 30 / room_speed;

passThrough = true;
destroyOnReflect = true;
explosionEffect = true;

chaseTimer = 0;
chaseTime = 20;
targetLocked = false;

target = -1;    //Current target being chased
item = -1;  //Current item being carried
