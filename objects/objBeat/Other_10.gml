/// @description Set starting speed
if target != -1 && instance_exists(target)
{
	image_xscale = target.image_xscale;
	xspeed = target.x - x;
    yspeed = target.bbox_top - y;
	var norm = sqrt(power(xspeed,2) + power(yspeed,2));
    xspeed = xspeed * normalSpd / norm;
    yspeed = yspeed * normalSpd / norm;
}

