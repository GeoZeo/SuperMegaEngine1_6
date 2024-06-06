if canStep == true
{
    if global.frozen == false
    {
        image_speed = imgSpeed;
        
		if id_of_origin == prtPlayer
		{
			speed = 6;
		}
		else
		{
			x += xspeed * update_rate;
			y += yspeed * update_rate;
		}
    }
    else
    {
        image_speed = 0;
		
		speed = 0;
    }
}

