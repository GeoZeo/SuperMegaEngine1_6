if (((hspeed >= 0 and x >= target_x and x-hspeed <= target_x)
or (hspeed <= 0 and x <= target_x and x-hspeed >= target_x))
&& (((vspeed >= 0 and y >= target_y and y-vspeed <= target_y)
or (vspeed <= 0 and y <= target_y and y-vspeed >= target_y))))
{
	instance_destroy();
}

