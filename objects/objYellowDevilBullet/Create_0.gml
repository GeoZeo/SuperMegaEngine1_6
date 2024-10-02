event_inherited();

spd = 6;
contactDamage = 4;
destroyOnReflect = true;

if instance_exists(prtPlayer) {
    hspeed = prtPlayer.x - x;
    vspeed = prtPlayer.y - y;
    var norm = sqrt(power(hspeed,2) + power(vspeed,2));
    hspeed = hspeed * spd / norm;
    vspeed = vspeed * spd / norm;
}

_hspeed = hspeed;
_vspeed = vspeed;

