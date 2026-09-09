if !global.frozen
{
	image_speed = 10 / room_speed;
	
	//If the player is present
	if target != -1 && (instance_exists(target) or target_found)
	{	
		//Flying towards the bottom of the screen (to pick the player up)
		if !carrying && transportTimer < transportTime
		{
			image_xscale = target.image_xscale;
			tired = false;
			transportTimer = 0;
			
			//If the player somehow recovered from a pitfall WITHOUT Beat, fly away and roll back Beat counter
			if insideViewObj_Spr(target)
			{
				target_found = false;
				
				if objBeatEquip.count < objBeatEquip.maxUnits
				{
					objBeatEquip.count++;
					if objBeatEquip.count >= objBeatEquip.maxUnits
						objBeatEquip.count = objBeatEquip.maxUnits;
				}
				
				transportTimer = transportTime;
				carrying = false;
				tired = false;
						
				if object_is_ancestor(target.object_index, prtPlayer) target.canMove = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.canHit = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.canGravity = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.invincibilityTimer = 0;
				if object_is_ancestor(target.object_index, prtPlayer) target.canSpriteChange = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.isFly = false;
				if object_is_ancestor(target.object_index, prtPlayer) target.flying = false;
				if object_is_ancestor(target.object_index, prtPlayer) target.isRollback = false;
				if object_is_ancestor(target.object_index, prtPlayer) target.rollbackMovement = false;
				target.visible = true;
				yspeed = -normalSpd;	
			}
			
			//Picking up the player
			if bbox_top >= global.viewY + global.viewHeight
			&& transportTimer < transportTime
			{
				target_found = false;
				xspeed = 0;
				yspeed = 0;
				
				if object_is_ancestor(target.object_index, prtPlayer)
				{
					global.xspeed = xspeed;
					global.yspeed = -pullSpd;
				}
				else
				{
					target.xspeed = xspeed;
					target.yspeed = -pullSpd;
				}
				
				target.y = round((global.viewY + global.viewHeight)+target.sprite_yoffset);
				
				var _beatPriority = false;
				with target
					if !place_free(x, y-(abs(bbox_top-round(global.viewY+global.viewHeight))+1))
						_beatPriority = true;
				
				if !_beatPriority
					x = target.x;
				else
					target.x = x;
					
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
						isFly = true;
						flying = true;
						isRollback = true;
						rollbackMovement = true;
						mask_index = mskMegaman;
						invincibilityTimer = other.transportTime;
					}
				}
				
				carrying = true;
			}
		}
		//Carrying the player
		else if carrying && transportTimer < transportTime
		{
			transportTimer++;
			
			//While timer is still going
			if transportTimer < transportTime
			{
				//If we're a second away from the end of the timer, switch to tired animation
				if transportTimer >= transportTime - (1 * 60)
				{
					tired = true;
				}
			}
			//Timer expired
			else
			{
				transportTimer = transportTime;
				carrying = false;
				tired = false;
				if object_is_ancestor(target.object_index, prtPlayer)
				{
					global.yspeed = 0; //TODO?: Reset only if speed is 0 or less?
				}
				else
				{
					target.yspeed = 0; //TODO?: Reset only if speed is 0 or less?
				}
				
				with target
				{
					if !place_free(x, y+1)
					{
						ground = false;
					}
				}
				
				if object_is_ancestor(target.object_index, prtPlayer) target.canMove = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.canHit = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.canGravity = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.invincibilityTimer = 0;
				if object_is_ancestor(target.object_index, prtPlayer) target.canSpriteChange = true;
				if object_is_ancestor(target.object_index, prtPlayer) target.isFly = false;
				if object_is_ancestor(target.object_index, prtPlayer) target.flying = false;
				if object_is_ancestor(target.object_index, prtPlayer) target.isRollback = false;
				if object_is_ancestor(target.object_index, prtPlayer) target.rollbackMovement = false;
				target.visible = true;
				yspeed = -normalSpd;
			}
		}
		//Transport timer expired and no longer carrying the player
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
				image_index++;
				flapCounter = 0;
			}
		}
	}
}
else
{
	image_speed = 0;
}
if !tired
{
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
//print(flapCounter);

