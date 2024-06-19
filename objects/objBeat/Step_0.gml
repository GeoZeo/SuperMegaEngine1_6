if !global.frozen
{
	image_speed = 10 / room_speed;
	
	if target != -1 && instance_exists(target)
	{	
		if !carrying && transportTimer < transportTime
		{
			image_xscale = target.image_xscale;
			tired = false;
			
			if !(x < target.x-2 || x > target.x+2 || y < target.bbox_top-2 || y > target.bbox_top+2)
			{
				xspeed = 0;
				yspeed = 0;
				target.x = x;
				target.y = y + target.sprite_yoffset;
				global.xspeed = xspeed;
				global.yspeed = yspeed;
				carrying = true;
			}
		}
		else if carrying && transportTimer < transportTime
		{
			transportTimer++;
			if transportTimer < transportTime
			{
				if transportTimer < 1 * 60
				{
					yspeed = -pullSpd;
				}
				else
				{
					yspeed = 0;
					if transportTimer >= 3 * 60
					{
						tired = true;
					}
				}
				global.xspeed = xspeed;
				global.yspeed = yspeed;
			}
			else
			{
				transportTimer = transportTime;
				carrying = false;
				tired = false;
				global.yspeed = 0;
				if object_is_ancestor(target.object_index, prtPlayer) target.canMove = true;
			}
		}
		else
		{
			yspeed = -normalSpd;
		}
	}
	
	x += xspeed * update_rate;
	y += yspeed * update_rate;
	
	if !tired
	{
		if image_index == 2
		{
			flapCounter++;
			if flapCounter >= flapCount
			{
				image_index = 3;
				flapCounter = 0;
			}
		}
		if image_index >= 4 || (image_index >= 3 and flapCounter > 0)
		{
			image_index = 0;
		}
	}
	else
	{
		if image_index < 4
		{
			if image_index == 3
				image_index += 3;
			else
				image_index += 4;
		}
	}
}
else
{
	image_speed = 0;
}

