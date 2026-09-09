/// @description beatStep()
function beatStep() {
	//Handles general step event code for the player while Beat is active
	
	//While Beat is flying towards the player
	if !objBeat.carrying && objBeat.transportTimer < objBeat.transportTime
	{
		//Stay in the same position
		if y >= round((global.viewY+global.viewHeight)+30)
		{
			y = round((global.viewY+global.viewHeight)+30);
			global.yspeed = 0;
		}
	}
	//While being carried
	else if objBeat.carrying && objBeat.transportTimer < objBeat.transportTime
	{
		if objBeat.transportTimer < objBeat.transportTime
		{
			//Being pulled out of a pit
			if objBeat.transportTimer < 1 * 60
			{
				if place_free(x, y-1)
				{
					global.yspeed = -objBeat.pullSpd;
				}
				//Halt the timer if there's an object above us
				else if bbox_bottom > sectionBottom
				{
					objBeat.transportTimer--;
				}
			}
			//Movement
			else
			{
				var _transportSpd = objBeat.transportSpd;
				var _transportAcc = objBeat.transportAcc;
				var _transportDec = objBeat.transportDec;
				var _fallSpd = objBeat.fallSpd;
				
				//Horizontal movement
				//Left
				if global.keyLeft && !global.keyRight
				{
					image_xscale = -1;
					objBeat.image_xscale = -1;
					if collision_rectangle_free(bbox_left-1, bbox_top, mask_get_xcenter(), bbox_bottom, false, true, false) && !(global.xspeed <= 0 and (bbox_left+global.xspeed-1 < sectionLeft or bbox_left+global.xspeed-1 < 0))
					{
						if global.xspeed > -_transportSpd
						{
							global.xspeed -= _transportAcc
							if global.xspeed <= -_transportSpd
							{
								global.xspeed = -_transportSpd;
							}
						}
					}
				}
				//Right
				else if global.keyRight && !global.keyLeft
				{
					image_xscale = 1;
					objBeat.image_xscale = 1;
					if collision_rectangle_free(mask_get_xcenter(), bbox_top, bbox_right+1, bbox_bottom, false, true, false) && !(global.xspeed >= 0 and (bbox_right+global.xspeed+1 > sectionRight or bbox_right+global.xspeed+1 > room_width))
					{
						if global.xspeed < _transportSpd
						{
							global.xspeed += _transportAcc
							if global.xspeed >= _transportSpd
							{
								global.xspeed = _transportSpd;
							}
						}
					}
				}
				//No horizontal input - roll xspeed back to 0
				else
				{
					if global.xspeed < 0
					{
						global.xspeed += _transportDec;
						if global.xspeed >= 0
						{
							global.xspeed = 0;
						}
					}
					else if global.xspeed > 0
					{
						global.xspeed -= _transportDec;
						if global.xspeed <= 0
						{
							global.xspeed = 0;
						}
					}
				}
				//Vertical movement
				//Up
				if global.keyUp && !global.keyDown
				{	
					if collision_rectangle_free(bbox_left, bbox_top-1, bbox_right, mask_get_ycenter(), false, true, false) && !(global.yspeed <= 0 and (bbox_top+global.yspeed-1 < sectionTop - sprite_height or bbox_top+global.yspeed-1 < 0 - sprite_height))
					{
						if global.yspeed > -_transportSpd
						{
							global.yspeed -= _transportAcc
							if global.yspeed <= -_transportSpd
							{
								global.yspeed = -_transportSpd;
							}
						}
					}
				}
				//Down
				else if global.keyDown && !global.keyUp
				{
					if collision_rectangle_free(bbox_left, mask_get_ycenter(), bbox_right, bbox_bottom+1, false, true, false) && !(global.yspeed >= 0 and (bbox_bottom+global.yspeed+1 > sectionBottom or bbox_bottom+global.yspeed+1 > room_height))
					{
						if global.yspeed < _transportSpd
						{
							global.yspeed += _transportAcc
							if global.yspeed >= _transportSpd
							{
								global.yspeed = _transportSpd;
							}
						}
					}
				}
				//No vertical input - falling
				else
				{
					if (collision_rectangle_free(bbox_left, mask_get_ycenter(), bbox_right, bbox_bottom + _fallSpd, false, true, false) and !(global.yspeed >= 0 and (bbox_bottom+global.yspeed+1 > sectionBottom or bbox_bottom+global.yspeed+1 > room_height))) 
					|| global.yspeed <= 0
					{
						if global.yspeed < _fallSpd
						{
							global.yspeed += _transportDec;
							if global.yspeed >= _fallSpd
							{
								global.yspeed = _fallSpd;
							}
						}
						else if global.yspeed > _fallSpd
						{
							global.yspeed -= _transportDec;
							if global.yspeed <= _fallSpd
							{
								global.yspeed = _fallSpd;
							}
						}
					}
					else
					{
						if global.yspeed > _fallSpd
						{
							global.yspeed -= _transportDec;
							if global.yspeed <= _fallSpd
							{
								global.yspeed = _fallSpd;
							}
						}
					}
				}
			}
		}
	}
	
	
	//Allow movement
	var __old_x = x;
	var __old_y = y;
	move(global.xspeed, global.yspeed);
	if (global.xspeed > 0 and againstWallRight) || (global.xspeed < 0 and againstWallLeft)
	{
		x = __old_x;
	}
	if (global.yspeed > 0 and againstGround) || (global.yspeed < 0 and againstCeiling)
	{
		y = __old_y;
	}
	againstGround = false;
	againstWallLeft = false;
	againstWallRight = false;
	againstCeiling = false;
	
	
	//Avoids free movement on screen above
	if (!ground && !climbing && !instance_exists(objSectionSwitcher) && sprite_get_bottom() < sectionTop && global.yspeed <= -currentJumpSpeed) {
	    y = sectionTop - sprite_height;
	}


	//Stop movement at section borders
	if ((canMove or (instance_exists(objBeat) and objBeat.transportTimer < objBeat.transportTime)) || isSlide || isHit || isStun) && (visible or (instance_exists(objBeat) and objBeat.transportTimer < objBeat.transportTime)) {
	    if x > sectionRight-(7 - (image_xscale < 0)) && ((!place_meeting(x+(7 - (image_xscale < 0)), y, objSectionArrowRight) && !place_meeting(x-global.xspeed, y, objSectionArrowRight)) or (instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)) {
	        x = sectionRight-(7 - (image_xscale < 0));
	    }
	    else if x < sectionLeft+(7 - (image_xscale > 0)) && ((!place_meeting(x-(7 - (image_xscale > 0)), y, objSectionArrowLeft) && !place_meeting(x-global.xspeed, y, objSectionArrowLeft)) or (instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)) {
	        x = sectionLeft+(7 - (image_xscale > 0));
	    }    
	    if y < sectionTop - sprite_height {
	        y = sectionTop - sprite_height;
	    }
		else if bbox_bottom+1 > sectionBottom && (objBeat.carrying and objBeat.transportTimer >= 1 * 60 and objBeat.transportTimer < objBeat.transportTime)
		{
			if place_free(x, y - (bbox_bottom+1 - sectionBottom))
			{
				y = round(sectionBottom - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index))) - 1;
			}
		}
	}
	
	//Stop movement at room borders
	if x > room_width-(7 - (image_xscale < 0)) {
	    x = room_width-(7 - (image_xscale < 0));
	}
	else if x < (7 - (image_xscale > 0)) {
	    x = (7 - (image_xscale > 0));
	}
    
	if y < -sprite_height
	    y = -sprite_height;
	else if bbox_bottom+1 > room_height && (objBeat.carrying and objBeat.transportTimer >= 1 * 60 and objBeat.transportTimer < objBeat.transportTime)
	{
		if place_free(x, y - (bbox_bottom+1 - room_height))
		{
			y = round(room_height - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index))) - 1;
		}
	}
	
	//Dismounting prematurely
	if objBeat.carrying && objBeat.transportTimer < objBeat.transportTime && objBeat.transportTimer >= 1 * 60
	{
		var _shouldJump = (cfgEnableBuffering and global.keyJump and !global.hasJumped and room != rmWeaponGet) || global.keyJumpPressed;
		if _shouldJump
		{
			if (!locked && !showReady && !teleporting && !landing) global.hasJumped = true;
					
			with objBeat
			{
				transportTimer = transportTime;
				carrying = false;
				tired = false;
				yspeed = -normalSpd;
			}
					
			global.xspeed = 0;
			global.yspeed = 0;
						
			if !place_free(x, y+1)
			{
				ground = false;
			}
						
			canMove = true;
			canHit = true;
			canGravity = true;
			invincibilityTimer = 0;
			canSpriteChange = true;
			isFly = false;
			flying = false;
			isRollback = false;
			rollbackMovement = false;
			visible = true;
		}
	}
	
	//Water
	if place_meeting(x, y, objWater) && inWater == false
	{
	    inWater = true;
    
		var currentWater;
		currentWater = instance_place(x, y, objWater);
		if currentWater >= 0 && (insideViewObj_Spr(currentWater) or currentWater.bbox_bottom <= sectionTop)
		{
		    if bbox_bottom <= currentWater.bbox_top+global.yspeed+1
			&& currentWater.bbox_top < sectionBottom
			&& currentWater.bbox_top > sectionTop
		    {
				instance_create(x, currentWater.bbox_top+1, objSplash);
				playSFX(sfxSplash);
		    }
			else if bbox_top >= currentWater.bbox_bottom+global.yspeed-1
			&& currentWater.bbox_bottom < sectionBottom
			{
				var splash = instance_create(x, currentWater.bbox_bottom-1, objSplash);
				splash.image_yscale = -1;
				playSFX(sfxSplash);
			}
			if bbox_right <= currentWater.bbox_left+global.xspeed+1
			&& currentWater.bbox_left > sectionLeft
			&& currentWater.bbox_left < sectionRight
		    {
				instance_create(currentWater.bbox_left+1, y, objSplashH);
				playSFX(sfxSplash);
		    }
			else if bbox_left >= currentWater.bbox_right+global.xspeed-1
			&& currentWater.bbox_right > sectionLeft
			&& currentWater.bbox_right < sectionRight
			{
				var splash = instance_create(currentWater.bbox_right-1, y, objSplashH);
				splash.image_xscale = -1;
				playSFX(sfxSplash);
			}
		}
		else if currentWater >= 0 && !(insideViewObj_Spr(currentWater) or currentWater.bbox_bottom <= sectionTop)
		{
			inWater = false;
		}
	}

	if inWater == true
	{
	    currentGrav = gravWater;
	    currentJumpSpeed = jumpSpeedWater;
    
		bubbleTimer += 1;
		if bubbleTimer >= 10
		{
		    bubbleTimer = 0;
			
			var myBubble = -1;
			with objAirBubble
			{
				if id_of_origin = other.id || (index_of_origin == objArenaStartingPoint or index_of_origin == objBossDeathTimer)
					myBubble = id;
			}
			
			var myMM = -1;
			with objArenaStartingPoint
				if isMM 
					myMM = id;
			with objBossDeathTimer
				if isMM 
					myMM = id;
			
		    if myBubble < 0 && myMM < 0 && position_meeting(x, y-4, objWater)
		        instance_create(x, y, objAirBubble);
		}
	}
	else
	{
	    currentGrav = grav;
	    currentJumpSpeed = jumpSpeed;
	    bubbleTimer = 0;
	}


	//Leaving the water
	if inWater == true
	{
	    var wtr;
	    wtr = instance_place(x-global.xspeed, y-global.yspeed, objWater);
	    if wtr >= 0 && !place_meeting(x+sign(global.xspeed), y+sign(global.yspeed), objWater)
	    {
	        if bbox_bottom < wtr.bbox_top+1
	        {
				with wtr
				{
					if !collision_rectangle((other.x-8)+1, bbox_top-1, (other.x+8)-1, bbox_top, objWater, false, false)
					{
						other.inWater = false;
						if bbox_top < other.sectionBottom
						&& bbox_top > other.sectionTop
						{
							instance_create(other.x, bbox_top+1, objSplash);
							playSFX(sfxSplash);
						}
					}
				}
	        }
			else if bbox_top > wtr.bbox_bottom-1
	        {
				with wtr
				{
					if !collision_rectangle((other.x-8)+1, bbox_bottom, (other.x+8)-1, bbox_bottom+1, objWater, false, false)
					{
						other.inWater = false;
						if bbox_bottom < other.sectionBottom
						{
							var splash = instance_create(other.x, bbox_bottom-1, objSplash);
							splash.image_yscale = -1;
					        playSFX(sfxSplash);
						}
					}
				}
	        }
			if bbox_right < wtr.bbox_left+1
	        {
				with wtr
				{
					if !collision_rectangle(bbox_left-1, (other.y-8)+1, bbox_left, (other.y+8)-1, objWater, false, false)
					{
						other.inWater = false;
						if bbox_left > other.sectionLeft
						&& bbox_left < other.sectionRight
						{
							instance_create(bbox_left+1, other.y, objSplashH);
					        playSFX(sfxSplash);
						}
					}
				}
	        }
			else if bbox_left > wtr.bbox_right-1
	        {
				with wtr
				{
					if !collision_rectangle(bbox_right, (other.y-8)+1, bbox_right+1, (other.y+8)-1, objWater, false, false)
					{
						other.inWater = false;
						if bbox_right > other.sectionLeft
						&& bbox_right < other.sectionRight
						{
							var splash = instance_create(bbox_right-1, other.y, objSplashH);
							splash.image_xscale = -1;
					        playSFX(sfxSplash);
						}
					}
				}
	        }
	    }
		else if !place_meeting(x, y, objWater)
		{
			inWater = false;
		}
	}
	
	//Flickering
	if objBeat.transportTimer < objBeat.transportTime
	{
	    if (objBeat.transportTimer mod 4 == 3 or objBeat.transportTimer mod 4 == 2)
		{
	        visible = false;
		}
	    else
		{
	        visible = true;
		}
	}
	
	//Guard Power Up effect
	if createGuardPowerUpEffect
	{
		if !instance_exists(objGuardPowerUpEffect)
		{
			instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objGuardPowerUpEffect);
			createGuardPowerUpEffect = false;
		}
	}
	
	//Dying
	if global._health <= 0 {
		dead = true;
		canPause = false;
		with objPauseMenu instance_destroy();
		invincibilityTimer = 0;
		
		if killTime <= 0 {
			if !deathByPit {
		        var i, explosionID;
            
		        i = 0;
		        repeat 8 {
		            explosionID = instance_create(x, y, objMegamanExplosion);
					explosionID.depth = -3;
		            explosionID.dir = i;
		            explosionID.spd = 1.5;
					with objBossDeathTimer {
						if isMM {
							explosionID.x = x;
							explosionID.y = y;
						}
					}
					with objArenaStartingPoint {
						if isMM {
							explosionID.x = x;
							explosionID.y = y;
						}
					}
                
		            i += 45;
		        }
        
		        i = 0;
		        repeat 8 {
		            explosionID = instance_create(x, y, objMegamanExplosion);
					explosionID.depth = -3;
		            explosionID.dir = i;
		            explosionID.spd = 2.5;
					with objBossDeathTimer {
						if isMM {
							explosionID.x = x;
							explosionID.y = y;
						}
					}
					with objArenaStartingPoint {
						if isMM {
							explosionID.x = x;
							explosionID.y = y;
						}
					}
                
		            i += 45;
		        }
		    }
    
			with objBossDeathTimer instance_destroy();
			
			with objBeat
			{
				transportTimer = transportTime;
				carrying = false;
				tired = false;
				yspeed = -normalSpd;
			}
			
		    instance_create(x, y, objMegamanDeathTimer); //Because the Mega Man object is destoyed upon death, we need to make a different object execute the room restarting code
			instance_destroy();
    
		    stopAllSFX();
		    playSFX(sfxDeath);
		}
		else {
			global.frozen = true;
			visible = false;
			with objBossDeathTimer {
				if isMM visible = false;
			}
			with objArenaStartingPoint {
				if isMM visible = false;
			}
			stopAllSFX();
		}
	}
	
	if pltSpeedX == 0 && pltSpeedY == 0 && prevPltSpeedX == 0 && prevPltSpeedY == 0 && !pushedBySpawnedSolid
	{
		var myPlt = instance_place(x, y, prtMovingPlatformSolid)
		if myPlt >= 0 && !myPlt.dead && insideViewObj_Spr(myPlt)
		{
			instance_deactivate_object(myPlt.id);
            var movingPltfm, meetingPlatform;
            movingPltfm = collision_rectangle(bbox_left, bbox_top - ((isSlide or isStun) * 2), bbox_right, bbox_bottom + ((isSlide or isStun) * 2), prtMovingPlatformSolid, false, false);
                
            meetingPlatform = false;
            if movingPltfm >= 0
            {
                if movingPltfm.dead == false
                    meetingPlatform = true;
            }
                
            if !meetingPlatform
				escapeWall(true, true, true, true);
				
			instance_activate_object(myPlt.id);
		}
		else
		{
			escapeWall(true, true, true, true);
		}
	}
	
	if global.yspeed == 0 && !place_meeting(x, y+2, objSolid) && (!place_meeting(x, y+2, prtMovingPlatformSolid)
	|| instance_place(x, y+2, prtMovingPlatformSolid).dead) && movedPlatformID == -20 && !pushedBySpawnedSolid
		escapeWall(false, false, false, true);

	if place_free(x, y)
	{
		prevPltSpeedX = pltSpeedX;
		prevPltSpeedY = pltSpeedY;
	}
	
	ground = prevGround;
	
	
	
}
