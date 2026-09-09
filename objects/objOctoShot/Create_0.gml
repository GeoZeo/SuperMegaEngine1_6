event_inherited();

image_speed = 1/3;

spd = 2;

contactDamage = 3;

destroyOnReflect = true;
explosionEffectReflect = true;

xspeed = player_x - x;
yspeed = player_y - y;
len = sqrt(power(xspeed,2) + power(yspeed,2));
xspeed = xspeed / len * spd;
yspeed = yspeed / len * spd;

