/// @description Set aim
hspeed = player_x - x;
vspeed = player_y - y;
var norm = sqrt(power(hspeed,2) + power(vspeed,2));
hspeed = hspeed * spd / norm;
vspeed = vspeed * spd / norm;

_hspeed = hspeed;
_vspeed = vspeed;

