if !global.frozen
{
	image_speed = 10 / room_speed;
	
	if target != -1 && (instance_exists(target) or target_found)
	{	
		if !carrying && transportTimer < transportTime
		{
			image_xscale = target.image_xscale;
			tired = false;
			transportTimer = 0;
			
			if insideViewObj_Spr(target)
			{
				instance_activate_object(target);
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
				target.visible = true;
				yspeed = -normalSpd;	
			}
			
			if bbox_top >= global.viewY + global.viewHeight
			&& transportTimer < transportTime
			{
				instance_activate_object(target);
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
						mask_index = mskMegaman;
						invincibilityTimer = other.transportTime;
					}
				}
				
				carrying = true;
				
				with target escapeWall(false, false, true, true);
			}
			
			if !carrying && !instance_exists(prtPlayer) && !instance_exists(objMegamanDeathTimer)
			{
				instance_activate_object(prtPlayer);
				with prtPlayer playerPause();
				with prtPlayer playerSwitchWeapons();
				instance_deactivate_object(prtPlayer);
			}
		}
		else if carrying && transportTimer < transportTime
		{
			transportTimer++;
			if transportTimer < transportTime
			{
				if transportTimer < 1 * 60
				{
					var _move = false;
					with target
						if place_free(x, y-1)
							_move = true;
					
					if object_is_ancestor(target.object_index, prtPlayer)
					{
						if _move
							global.yspeed = -pullSpd;
					}
					else
					{
						if _move
							target.yspeed = -pullSpd;
					}
				}
				else
				{
					//global.keyJumpPressed = true;
					
					if global.keyLeft && !global.keyRight
					{
						image_xscale = -1;
						target.image_xscale = -1;
						
						var _move = false;
						with target
							if place_free(x-1, y)
								_move = true;
								
						with target
						{
							var _attempts = 0;
							while !place_free(x+1, y) && _attempts < 100
							{
								x -= other.transportAcc;
								_attempts++;
							}
						}
						
						if object_is_ancestor(target.object_index, prtPlayer)
						{			
							if _move
							{
								if global.xspeed > -transportSpd
								{
									global.xspeed -= transportAcc
									if global.xspeed <= -transportSpd
									{
										global.xspeed = -transportSpd;
									}
								}
							}
						}
						else
						{
							if _move
							{
								if target.xspeed > -transportSpd
								{
									target.xspeed -= transportAcc
									if target.xspeed <= -transportSpd
									{
										target.xspeed = -transportSpd;
									}
								}
							}
						}
						
						if !_move
							target.x = round(target.x);
					}
					else if global.keyRight && !global.keyLeft
					{
						image_xscale = 1;
						target.image_xscale = 1;
						
						var _move = false;
						with target
							if place_free(x+1, y)
								_move = true;
								
						with target
						{
							var _attempts = 0;
							while !place_free(x-1, y) && _attempts < 100
							{
								x += other.transportAcc;
								_attempts++;
							}
						}
						
						if object_is_ancestor(target.object_index, prtPlayer)
						{
							if _move
							{
								if global.xspeed < transportSpd
								{
									global.xspeed += transportAcc
									if global.xspeed >= transportSpd
									{
										global.xspeed = transportSpd;
									}
								}
							}
						}
						else
						{
							if _move
							{
								if target.xspeed < transportSpd
								{
									target.xspeed += transportAcc
									if target.xspeed >= transportSpd
									{
										target.xspeed = transportSpd;
									}
								}
							}
						}
						
						if !_move
							target.x = round(target.x);
					}
					else
					{
						if object_is_ancestor(target.object_index, prtPlayer)
						{
							var _move = false;
							with target
								if (place_free(x-1, y) and global.xspeed < 0) or (place_free(x+1, y) and global.xspeed > 0)
									_move = true;
									
							with target
							{
								var _attempts = 0;
								while !place_free(x+sign(global.xspeed), y) && _attempts < 100
								{
									x -= other.transportDec * sign(global.xspeed);
									_attempts++;
								}
							}
							
							if _move
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
							else
							{
								target.x = round(target.x);
							}
						}
						else
						{
							var _move = false;
							with target
								if (place_free(x-1, y) and xspeed < 0) or (place_free(x+1, y) and xspeed > 0)
									_move = true;
									
							with target
							{
								var _attempts = 0;
								while !place_free(x+sign(xspeed), y) && _attempts < 100
								{
									x -= other.transportDec * sign(xspeed);
									_attempts++;
								}
							}
							
							if _move
							{
								if target.xspeed < 0
								{
									target.xspeed += transportDec;
									if target.xspeed >= 0
									{
										target.xspeed = 0;
									}
								}
								else if target.xspeed > 0
								{
									target.xspeed -= transportDec;
									if target.xspeed <= 0
									{
										target.xspeed = 0;
									}
								}
							}
							else
							{
								target.x = round(target.x);
							}
						}
					}
					
					if global.keyUp && !global.keyDown
					{
						var _move = false;
						with target
							if place_free(x, y-1)
								_move = true;
								
						with target
						{
							var _attempts = 0;
							while !place_free(x, y+1) && _attempts < 100
							{
								y -= other.transportAcc;
								_attempts++;
							}
						}
						
						if object_is_ancestor(target.object_index, prtPlayer)
						{
							if _move
							{
								if global.yspeed > -transportSpd
								{
									//with target
									//	if global.yspeed >= 0 && !place_free(x, y+1)
									//		global.yspeed = 0;
										
									global.yspeed -= transportAcc
									if global.yspeed <= -transportSpd
									{
										global.yspeed = -transportSpd;
									}
								}
							}
						}
						else
						{
							if _move
							{
								if target.yspeed > -transportSpd
								{
									//with target
									//	if yspeed >= 0 && !place_free(x, y+1)
									//		yspeed = 0;
									
									target.yspeed -= transportAcc
									if target.yspeed <= -transportSpd
									{
										target.yspeed = -transportSpd;
									}
								}
							}
						}
						
						if !_move
							target.y = round(target.y);
					}
					else if global.keyDown && !global.keyUp
					{
						var _move = false;
						with target
							if place_free(x, y+1)
								_move = true;
								
						with target
						{
							var _attempts = 0;
							while !place_free(x, y-1) && _attempts < 100
							{
								y += other.transportAcc;
								_attempts++;
							}
						}
						
						if object_is_ancestor(target.object_index, prtPlayer)
						{
							if _move
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
						}
						else
						{
							if _move
							{
								if target.yspeed < transportSpd
								{
									target.yspeed += transportAcc
									if target.yspeed >= transportSpd
									{
										target.yspeed = transportSpd;
									}
								}
							}
						}
						
						if !_move
							target.y = round(target.y);
					}
					else
					{
						with target
						{
							var _attempts = 0;
							while !place_free(x, y-1) && _attempts < 100
							{
								y += other.transportDec;
								_attempts++;
							}
						}
						
						if object_is_ancestor(target.object_index, prtPlayer)
						{
							var _move = false;
							with target
								if (place_free(x, y-1) and global.yspeed < 0) or (place_free(x, y+1) and global.yspeed >= 0)
									_move = true;
							
							if _move
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
							else
							{
								target.y = round(target.y);
							}
						}
						else
						{
							var _move = false;
							with target
								if (place_free(x, y-1) and yspeed < 0) or (place_free(x, y+1) and yspeed >= 0)
									_move = true;
							
							if _move
							{
								if target.yspeed < fallSpd
								{
									target.yspeed += transportDec;
									if target.yspeed >= fallSpd
									{
										target.yspeed = fallSpd;
									}
								}
								else if target.yspeed > fallSpd
								{
									target.yspeed -= transportDec;
									if target.yspeed <= fallSpd
									{
										target.yspeed = fallSpd;
									}
								}
							}
							else
							{
								target.y = round(target.y);
							}
						}
					}
					
					print(global.yspeed);
					
					if transportTimer >= 3 * 60
					{
						tired = true;
					}
					
					if global.keyJumpPressed
					{
						transportTimer = transportTime;
						carrying = false;
						tired = false;
						if object_is_ancestor(target.object_index, prtPlayer)
						{
							global.yspeed = 0;
						}
						else
						{
							target.yspeed = 0;
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
						target.visible = true;
						yspeed = -normalSpd;
					}
				}
				
				if instance_exists(prtPlayer)
				&& ((object_is_ancestor(target.object_index, prtPlayer) and target.bbox_bottom+1+global.yspeed > prtPlayer.sectionBottom) or (!object_is_ancestor(target.object_index, prtPlayer) and target.bbox_bottom+1+target.yspeed > prtPlayer.sectionBottom))
				&& transportTimer >= 1 * 60
				{
					if object_is_ancestor(target.object_index, prtPlayer)
					{
						global.yspeed = 0;
					}
					else
					{
						target.yspeed = 0;
					}
					
					with target
						if place_free(x, y-(sprite_get_height(mask_index)-1))
							y = round(prtPlayer.sectionBottom - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index))) - 1;
				}
			}
			else
			{
				transportTimer = transportTime;
				carrying = false;
				tired = false;
				if object_is_ancestor(target.object_index, prtPlayer)
				{
					global.yspeed = 0;
				}
				else
				{
					target.yspeed = 0;
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
print(flapCounter);

