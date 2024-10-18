/// @description Set aim
xspeed = player_x - x;
yspeed = player_y - y;
len = sqrt(power(xspeed,2) + power(yspeed,2));
xspeed = xspeed / len * spd;
yspeed = yspeed / len * spd;

