if global.frozen == false
{
    image_speed = 1/2;
	
	if instance_exists(prtPlayer)
	{
		x = sprite_get_xcenter_object(prtPlayer);
		y = sprite_get_ycenter_object(prtPlayer);
	}
}
else
{
    image_speed = 0;
    alarm[0] += 1;
}

