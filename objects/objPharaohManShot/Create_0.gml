event_inherited();

contactDamage = 2;

var spd;
spd = 5;
if instance_exists(prtPlayer)
{
    var angle;
    angle = point_direction(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter_object(prtPlayer), sprite_get_ycenter_object(prtPlayer));
    
    xspeed = cos(degtorad(angle)) * spd;
    yspeed = -sin(degtorad(angle)) * spd;
}
else
{
    xspeed = spd;
    yspeed = 0;
}

