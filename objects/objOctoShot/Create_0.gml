event_inherited();

spd = 2;

contactDamage = 3;

destroyOnReflect = true;

if instance_exists(prtPlayer) {

    xspeed = prtPlayer.x - x;
    yspeed = prtPlayer.y - y;
    len = sqrt(power(xspeed,2) + power(yspeed,2));
    xspeed = xspeed / len * spd;
    yspeed = yspeed / len * spd;

}

