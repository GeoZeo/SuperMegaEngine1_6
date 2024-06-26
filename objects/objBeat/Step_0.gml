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
				global.xspeed = xspeed;
				global.yspeed = -pullSpd;
				if !object_is_ancestor(target.object_index, prtPlayer) target.xspeed = global.xspeed;
				if !object_is_ancestor(target.object_index, prtPlayer) target.yspeed = global.yspeed;
				x = target.x;
				y = target.bbox_top;
				target.ground = false;
				
				if object_is_ancestor(target.object_index, prtPlayer)
				{
					with target
					{
						isStep = false;
						stepTimer = 0;
						cancelStep = false;
					    climbing = false;
						canHit = false;
						canGravity = false;
						isShoot = false;
						isThrow = false;
						isSlide = false;
						onRushJet = false;
						mask_index = mskMegaman;
						invincibilityTimer = other.transportTime;
					}
				}
				
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
					global.yspeed = -pullSpd;
				}
				else
				{
					if global.keyLeft && !global.keyRight
					{
						image_xscale = -1;
						target.image_xscale = -1;
						
						if global.xspeed > -transportSpd
						{
							global.xspeed -= transportAcc
							if global.xspeed <= -transportSpd
							{
								global.xspeed = -transportSpd;
							}
						}
					}
					else if global.keyRight && !global.keyLeft
					{
						image_xscale = 1;
						target.image_xscale = 1;
						
						if global.xspeed < transportSpd
						{
							global.xspeed += transportAcc
							if global.xspeed >= transportSpd
							{
								global.xspeed = transportSpd;
							}
						}
					}
					else
					{
						if global.xspeed < 0
						{
							global.xspeed += transportDec;
							if global.xspeed >= 0
							{
								global.xspeed = 0;
							}
						}
						else if global.xspeed > 0
						{
							global.xspeed -= transportDec;
							if global.xspeed <= 0
							{
								global.xspeed = 0;
							}
						}
					}
					if global.keyUp && !global.keyDown
					{
						if global.yspeed > -transportSpd
						{
							global.yspeed -= transportAcc
							if global.yspeed <= -transportSpd
							{
								global.yspeed = -transportSpd;
							}
						}
					}
					else if global.keyDown && !global.keyUp
					{
						if global.yspeed < transportSpd
						{
							global.yspeed += transportAcc
							if global.yspeed >= transportSpd
							{
								global.yspeed = transportSpd;
							}
						}
					}
					else
					{
						if global.yspeed < fallSpd
						{
							global.yspeed += transportDec;
							if global.yspeed >= fallSpd
							{
								global.yspeed = fallSpd;
							}
						}
						else if global.yspeed > fallSpd
						{
							global.yspeed -= transportDec;
							if global.yspeed <= fallSpd
							{
								global.yspeed = fallSpd;
							}
						}
					}
					
					if transportTimer >= 3 * 60
					{
						tired = true;
					}
					
					if global.keyJumpPressed
					{
						transportTimer = transportTime;
						carrying = false;
						tired = false;
						global.yspeed = 0;
						if !object_is_ancestor(target.object_index, prtPlayer) target.yspeed = global.yspeed;
						
						if object_is_ancestor(target.object_index, prtPlayer) target.canMove = true;
						if object_is_ancestor(target.object_index, prtPlayer) target.canHit = true;
						if object_is_ancestor(target.object_index, prtPlayer) target.canGravity = true;
						if object_is_ancestor(target.object_index, prtPlayer) target.invincibilityTimer = 0;
						target.visible = true;
						yspeed = -normalSpd;
					}
				}
				
				if instance_exists(prtPlayer) && target.bbox_bottom+1+global.yspeed > prtPlayer.sectionBottom && transportTimer >= 1 * 60
				{
					global.yspeed = 0;
					target.y = round(prtPlayer.sectionBottom - (sprite_get_height(target.mask_index) - sprite_get_yoffset(target.mask_index))) - 1;
				}
				
				x = target.x;
				y = target.bbox_top;
				if !object_is_ancestor(target.object_index, prtPlayer) target.xspeed = global.xspeed;
				if !object_is_ancestor(target.object_index, prtPlayer) target.yspeed = global.yspeed;
				
				target.ground = false;
			}
			else
			{
				transportTimer = transportTime;
				carrying = false;
				tired = false;
				global.yspeed = 0;
				if !object_is_ancestor(target.object_index, prtPlayer) target.yspeed = global.yspeed;
				
				if object_is_ancestor(target.object_index, prtPlayer) target.canMove = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.canHit = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.canGravity = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.invincibilityTimer = 0;
				target.visible = true;
				yspeed = -normalSpd;
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

