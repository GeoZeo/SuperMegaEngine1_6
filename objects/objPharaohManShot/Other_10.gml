/// @description Set aim
var spd;
spd = 5;

var angle;
angle = point_direction(sprite_get_xcenter(), sprite_get_ycenter(), player_x, player_y);
    
xspeed = cos(degtorad(angle)) * spd;
yspeed = -sin(degtorad(angle)) * spd;

