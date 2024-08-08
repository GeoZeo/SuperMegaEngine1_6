if !global.frozen
{	
	if isMM && instance_exists(prtPlayer)
	{
		prtPlayer.inWater = false;
		
		checkGround();
		checkWater();
		if !instance_exists(objBeat) || objBeat.transportTimer >= objBeat.transportTime gravityCheckGroundExt(currentGrav);
	    generalCollision();
		
		if !instance_exists(objBeat) || objBeat.transportTimer >= objBeat.transportTime
		{
			if x < xstart-2 || x > xstart+2
		    {
				if stepTimer < stepTime && ground && (sprite_index == prtPlayer.spriteStand or sprite_index == prtPlayer.spriteStep) && abs(xspeed) <= cfgStepSpeed * cfgStepFrames
				{
					if x < xstart
			        {
						if stepTimer <= 0
							xspeed = cfgStepSpeed * cfgStepFrames;
						else
							xspeed = 0;
			            image_xscale = 1;
			        }
			        else if x > xstart
			        {
			            if stepTimer <= 0
							xspeed = -cfgStepSpeed * cfgStepFrames;
						else
							xspeed = 0;
			            image_xscale = -1;
			        }
				
					stepTimer++;
					if stepTimer >= stepTime
						stepTimer = stepTime;
				}
				else
				{
					if x < xstart
			        {
			            xspeed = cfgWalkSpeed;
			            image_xscale = 1;
			        }
			        else if x > xstart
			        {
			            xspeed = -cfgWalkSpeed;
			            image_xscale = -1;
			        }
				}
            
		        if (place_meeting(x+xspeed*8, y, objSolid) || place_meeting(x+xspeed*8, y, prtMovingPlatformSolid))
		        && ground == true
		        {
		            if ((position_meeting(bbox_right+xspeed*8, bbox_top, objSolid) || position_meeting(bbox_right+xspeed*8, bbox_top, prtMovingPlatformSolid))
		            && image_xscale == 1)
		            || ((position_meeting(bbox_left+xspeed*8, bbox_top, objSolid) || position_meeting(bbox_left+xspeed*8, bbox_top, prtMovingPlatformSolid))
		            && image_xscale == -1) //If we are blocked by a wall of at least 2 blocks high, perform a high jump
		                yspeed = -5.25;
		            else //Else, perform a short, 1-block-high jump
		                yspeed = -3.5;
		        }
			
				//Jumping over pits in the arena (comment this out if you wish to troll people somehow)
				var _jump = ground;
				for (var i = 0; bbox_bottom+1+i < prtPlayer.sectionBottom; i += 8)
				{
					if place_meeting((x+xspeed)+sign(image_xscale), bbox_bottom+1+i, objSolid)
					|| place_meeting((x+xspeed)+sign(image_xscale), bbox_bottom+1+i, objTopSolid)
					|| place_meeting((x+xspeed)+sign(image_xscale), bbox_bottom+1+i, prtMovingPlatformSolid)
					|| place_meeting((x+xspeed)+sign(image_xscale), bbox_bottom+1+i, prtMovingPlatformJumpthrough)
					{
						_jump = false;
						break;
					}
				}
				if _jump == true
				{
					if (!((place_meeting(x+xspeed+16, y+1, objSolid) || place_meeting(x+xspeed+32, y+1, objSolid)) 
					|| (place_meeting(x+xspeed+16, y+1, objTopSolid) || place_meeting(x+xspeed+32, y+1, objTopSolid))
					|| (place_meeting(x+xspeed+16, y+1, prtMovingPlatformSolid) || place_meeting(x+xspeed+32, y+1, prtMovingPlatformSolid))
					|| (place_meeting(x+xspeed+16, y+1, prtMovingPlatformJumpthrough) || place_meeting(x+xspeed+32, y+1, prtMovingPlatformJumpthrough)))
					&& image_xscale == 1)
					|| (!((place_meeting((x+xspeed)-16, y+1, objSolid) || place_meeting((x+xspeed)-32, y+1, objSolid)) 
					|| (place_meeting((x+xspeed)-16, y+1, objTopSolid) || place_meeting((x+xspeed)-32, y+1, objTopSolid))
					|| (place_meeting((x+xspeed)-16, y+1, prtMovingPlatformSolid) || place_meeting((x+xspeed)-32, y+1, prtMovingPlatformSolid))
					|| (place_meeting((x+xspeed)-16, y+1, prtMovingPlatformJumpthrough) || place_meeting((x+xspeed)-32, y+1, prtMovingPlatformJumpthrough)))
					&& image_xscale == -1) //If there's a gap 3 tiles or more in length in front of and right below us, perform a high jump
						yspeed = -5.25
					else //Else, perform a short, 1-block-high jump
						yspeed = -3.5;
				}
            
		        if ground == true
				{
					if stepTimer < stepTime && (sprite_index == prtPlayer.spriteStand or sprite_index == prtPlayer.spriteStep) && abs(xspeed) <= cfgStepSpeed * cfgStepFrames
					{
						sprite_index = prtPlayer.spriteStep;
						image_speed = prtPlayer.speedStep;
					}
					else
					{
						sprite_index = prtPlayer.spriteWalk;
						image_speed = prtPlayer.speedWalk;
					}
				}
				else
				{
					sprite_index = prtPlayer.spriteJump;
					image_speed = prtPlayer.speedJump;
				}
                
                
		        if prevGround == false && ground == true && !audio_is_playing(sfxLand)
				&& (!instance_exists(objBeat) || objBeat.transportTimer >= objBeat.transportTime)
		            playSFX(sfxLand);
                
		        prevGround = ground;
		    }
		    else
		    {
				xspeed = 0;
		        if ground == true
		        {
		            x = xstart;
		            sprite_index = prtPlayer.spriteStand;
					image_speed = prtPlayer.speedStand;
					prtPlayer.sprite_index = sprite_index;
					prtPlayer.image_speed = image_speed;
					prtPlayer.x = x;
					prtPlayer.y = y;
					global.xspeed = 0;
					global.yspeed = 0;
					xspeed = 0;
		            yspeed = 0;
					prtPlayer.inWater = inWater;
					prtPlayer.bubbleTimer = bubbleTimer;
					prtPlayer.visible = true;
	                instance_destroy();
		        }
		    }
		}
		
	    x += xspeed;
	    y += yspeed;
		
		escapeWall(true, true, true, true);
		
		if instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime
		{
			if prtPlayer.canGravity prtPlayer.canGravity = false;
			
			if objBeat.carrying
			{
				if objBeat.transportTimer mod 2 == 1
		            visible = false;
		        else
		            visible = true;
			}
			else
			{
				visible = true;
			}
		}
		
		if bbox_top > prtPlayer.sectionBottom || bbox_top > room_height {
			if !instance_exists(objBeat) || objBeat.transportTimer >= objBeat.transportTime {
				if objBeatEquip.count < 1 {
					global._health = 0;
					prtPlayer.deathByPit = true;
				}
				else if global._health > 0 && !prtPlayer.dead {
					objBeatEquip.count--;
					
					var _ceil = abs(bbox_top-round(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )))+1;
					var _attempts = 0;
					var _old_x = x;
					while !place_free(x, y-_ceil) && _attempts < 500
					{
						if abs(xspeed) >= 1
						{
							x -= xspeed;
							_attempts += abs(xspeed);
						}
						else
						{
							if (instance_place(x, y-_ceil, objSolid) >= 0 && sprite_get_xcenter_object(instance_place(x, y-_ceil, objSolid))) >= x
							|| (instance_place(x, y-_ceil, prtMovingPlatformSolid) >= 0 && !instance_place(x, y-_ceil, prtMovingPlatformSolid).dead && sprite_get_xcenter_object(instance_place(x, y-_ceil, prtMovingPlatformSolid))) >= x
							{
								x -= 1;
								_attempts++;
							}
							else if (instance_place(x, y-_ceil, objSolid) >= 0 && sprite_get_xcenter_object(instance_place(x, y-_ceil, objSolid))) < x
							|| (instance_place(x, y-_ceil, prtMovingPlatformSolid) >= 0 && !instance_place(x, y-_ceil, prtMovingPlatformSolid).dead && sprite_get_xcenter_object(instance_place(x, y-_ceil, prtMovingPlatformSolid))) < x
							{
								x += 1;
								_attempts++;
							}
						}
					}
					if !place_free(x, y-_ceil)
						x = _old_x;
					
					xspeed = 0;
					if y-30 > round(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))
					{
						y = round((__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))+30);
						yspeed = 0;
						prtPlayer.drawWeaponIconTimer = -1;
						prtPlayer.drawWeaponIcon = false;
						instance_deactivate_object(self.id);
					}
				
					if !instance_exists(objBeat)
					{
						var myBeat = instance_create(x, round(__view_get( e__VW.YView, 0 )-3), objBeat);
						with myBeat depth = other.depth - 1;
						with myBeat target = other.id;
						with myBeat event_user(0);
					}
					else
					{
						objBeat.transportTimer = 0;
						with objBeat target = other.id;
						with objBeat event_user(0);
					}
				}
				
				with prtPlayer
				{
					global.weapons[global.currentWeapon].initChargeTimer = 0;
				    global.weapons[global.currentWeapon].chargeTimer = 0;
					global.weapons[global.currentWeapon].chargeAnimTimer = 0;
					shootTimer = 20;
					event_user(0);
					with weapons[global.currentWeapon] sound_stop(chargeSFX);
					with weapons[global.currentWeapon] sound_stop(chargedSFX);
					playChargeSound = true;
					playChargedSound = true;
				}
			}
			else if !objBeat.carrying {
				xspeed = 0;
				if y-30 > round(__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))
				{
					y = round((__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ))+30);
					yspeed = 0;
					prtPlayer.drawWeaponIconTimer = -1;
					prtPlayer.drawWeaponIcon = false;
					instance_deactivate_object(self.id);
				}
			}
		}
	}
}

