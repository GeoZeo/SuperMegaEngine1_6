/// @description playerStep()
function playerStep() {
	//Handles general step event code for the player
	
	//We're checking all "collisions" against our current speed as well as total force exerted
	var _total_xspeed = global.xspeed + global.xforce;
	var _total_yspeed = global.yspeed + global.yforce;

	//Can we do a short hop? (Placed earlier in the code to fix the 'jump on the frame you land and you can't do a short hop' bug)
	if !(ground == false && canJump == false && jumps >= maxJumps && place_free(x, y-2) && canGravity == true)
	    canMinJump = true;


	//Should the landing sound be played when colliding with a floor? (Disabled on ladders, for example)
	//Lasts two frames because one extra frame is required for the collision to register
	if playLandSoundTimer < 2
	{
	    playLandSoundTimer += 1;
	}
	else
	{
	    playLandSound = true;
	}
	

	//Movement (includes initializing sidestep while on the ground)
	var _xc = clamp(abs(_total_xspeed), 0.5, 1);
	if global.keyLeft && !global.keyRight { _xc = clamp(abs(_total_xspeed), 0.500005, 1); }
	var _frictionApplied = false;
	if canMove == true
	{
	    if ground == true
	    {	
	        if global.keyLeft && !global.keyRight && canWalk
	        {
	            if canInitStep == true
	            {
	                canInitStep = false;
	                isStep = true;
	                image_xscale = -1;
	            }
	            else if isStep == false
	            {
	                if !place_meeting(x, y+1, objIce)
	                {
	                    //Normal physics
	                    if !place_meeting(x-_xc, y, objSolid) && !place_meeting(x-_xc, y, prtMovingPlatformSolid)
	                        global.xspeed = -walkSpeed;
	                    else if place_meeting(x-_xc, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x-_xc, y, prtMovingPlatformSolid).dead == true
	                            global.xspeed = -walkSpeed;
	                    }
	                }
	                else if global.xspeed > 0
	                {
	                    //Ice physics
						if global.xspeed - iceDecWalk < 0
						{
		                    if !place_meeting(x-_xc, y, objSolid) && !place_meeting(x-_xc, y, prtMovingPlatformSolid)
		                        global.xspeed -= iceDecWalk;
		                    else if place_meeting(x-_xc, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
		                    {
		                        if instance_place(x-_xc, y, prtMovingPlatformSolid).dead == true
		                            global.xspeed -= iceDecWalk;
		                    }
						}
						else
						{
							global.xspeed -= iceDecWalk;
						}
	                }
					else if global.xspeed > -walkSpeed
					{
						//Ice physics
	                    if !place_meeting(x-_xc, y, objSolid) && !place_meeting(x-_xc, y, prtMovingPlatformSolid)
						{
							global.xspeed -= iceAccWalk;
							if global.xspeed <= -walkSpeed
								global.xspeed = -walkSpeed;
						}
	                    else if place_meeting(x-_xc, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x-_xc, y, prtMovingPlatformSolid).dead == true
	                        {
								global.xspeed -= iceAccWalk;
								if global.xspeed <= -walkSpeed
									global.xspeed = -walkSpeed;
							}
	                    }
					} //TODO: Review if we're supposed to keep our dash jump momentum while running on ice
                    
	                image_xscale = -1;
                            
	                if canSpriteChange == true
	                {
	                    sprite_index = spriteWalk;
	                    image_speed = speedWalk;
	                }
	            }
	        }
	        else if global.keyRight && !global.keyLeft && canWalk
	        {
	            if canInitStep == true
	            {
	                canInitStep = false;
	                isStep = true;
	                image_xscale = 1;
	            }
	            else if isStep == false
	            {	
	                if !place_meeting(x, y+_xc, objIce)
	                {
	                    //Normal physics
	                    if !place_meeting(x+_xc, y, objSolid) && !place_meeting(x+_xc, y, prtMovingPlatformSolid)
	                        global.xspeed = walkSpeed;
	                    else if place_meeting(x+_xc, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x+_xc, y, prtMovingPlatformSolid).dead == true
	                            global.xspeed = walkSpeed;
	                    }
	                }
	                else if global.xspeed < 0
	                {
						
	                    //Ice physics
						if global.xspeed + iceDecWalk > 0
						{
		                    if !place_meeting(x+_xc, y, objSolid) && !place_meeting(x+_xc, y, prtMovingPlatformSolid)
		                        global.xspeed += iceDecWalk;
		                    else if place_meeting(x+_xc, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
		                    {
		                        if instance_place(x+_xc, y, prtMovingPlatformSolid).dead == true
		                            global.xspeed += iceDecWalk;
		                    }
						}
						else
						{
							global.xspeed += iceDecWalk;
						}
	                }
					else if global.xspeed < walkSpeed
					{
						//Ice physics
	                    if !place_meeting(x+_xc, y, objSolid) && !place_meeting(x+_xc, y, prtMovingPlatformSolid)
						{
							global.xspeed += iceAccWalk;
							if global.xspeed >= walkSpeed
								global.xspeed = walkSpeed;
						}
	                    else if place_meeting(x+_xc, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
	                    {
	                        if instance_place(x+_xc, y, prtMovingPlatformSolid).dead == true
	                        {
								global.xspeed += iceAccWalk;
								if global.xspeed >= walkSpeed
									global.xspeed = walkSpeed;
							}
	                    }
					}
                    
	                image_xscale = 1;
                
	                if canSpriteChange == true
	                {
	                    sprite_index = spriteWalk;
	                    image_speed = speedWalk;
	                }
	            }
	        }
	        else
	        {
	            if !(place_meeting(x, y+1, objIce) && global.xspeed != 0)
	            {
	                //Normal physics
	                global.xspeed = 0;
	                canInitStep = true;
	            }
	            else
	            {
	                //Ice physics
	                if global.xspeed > 0
	                    global.xspeed -= iceDec;
	                else if global.xspeed < 0
	                    global.xspeed += iceDec;
                    
	                if global.xspeed > -iceDec && global.xspeed < iceDec
	                    global.xspeed = 0;
						
					_frictionApplied = true;
	            }
            
	            if global.keyLeft && !global.keyRight && canWalk
	                image_xscale = -1;
	            else if global.keyRight && !global.keyLeft && canWalk
	                image_xscale = 1;
            
	            if canSpriteChange {
	                image_speed = 0;
	                if !prevGround {    //Landing animation
	                    sprite_index = spriteWalk;
	                    image_index = 1;
	                }
	                else {
	                    sprite_index = spriteStand;
						image_speed = speedStand;
	                }
	            }
	        }
	    }
	    else
	    {
	        canInitStep = false;
	        isStep = false;
			stepTimer = 0;
			cancelStep = false;
        
	        if canSpriteChange == true {
	            sprite_index = spriteJump;
				image_index = speedJump;
			}
			
			var _moveSpeed = iif(!isDash, walkSpeed, dashSpeed);
            
	        if global.keyLeft && !global.keyRight && !place_meeting(x-_xc, y, objSolid) && canWalk
	        {
				image_xscale = -1;
	            if !place_meeting(x-_xc, y, prtMovingPlatformSolid)
	            {
	                global.xspeed = -_moveSpeed;
	            }
	            else
	            {
	                if instance_place(x-_xc, y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
	                {
	                    global.xspeed = -_moveSpeed;
	                }
	            }
	        }
	        else if global.keyRight && !global.keyLeft && !place_meeting(x+_xc + (prevXScale == -1), y, objSolid) && canWalk //For some reason, being on the left of the wall and facing left, then jumping and holding right would clip you through it. Prevented by checking if the player was facing left on the previous frame, and if so, disallow Mega Man to move if 2 pixels away from the wall instead of 1
	        {
				image_xscale = 1;
	            if !place_meeting(x+_xc + (prevXScale == -1), y, prtMovingPlatformSolid)
	            {
	                global.xspeed = _moveSpeed;
	            }
	            else
	            {
	                if instance_place(x+_xc + (prevXScale == -1), y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
	                {
	                    global.xspeed = _moveSpeed;
	                }
	            }
	        }
	        else
	        {
	            global.xspeed = 0;
            
	            if global.keyLeft && !global.keyRight && canWalk {
	                image_xscale = -1;
				}
	            else if global.keyRight && !global.keyLeft && canWalk {
	                image_xscale = 1;
				}
	        }
	    }
	}
	else if canSpriteChange == true
	{
	    //Even if canMove is false, we should still be able to change sprites
		if !climbing
		{
		    if ground == true
		    {
		        if global.xspeed == 0
		        {
		            sprite_index = spriteStand;
		            image_speed = speedStand;
		        }
		        else
		        {
		            sprite_index = spriteWalk;
		            image_speed = speedWalk;
		        }
		    }
		    else
		    {
		        sprite_index = spriteJump;
				image_speed = speedJump;
		    }
		}
		else
		{
			//Getup sprite
		    if !position_meeting(x, bbox_top+11, objLadder) && position_meeting(x, bbox_bottom+1, objLadder) //The second check is to make sure the getup animation is not shown when on the BOTTOM of a ladder that's placed in the air
		    {
		        sprite_index = spriteGetup;
				image_speed = speedGetup;
		        if sprite_index == spriteGetupDefault //not when shooting
		            image_xscale = 1;
		    }
		    else
		    {
		        sprite_index = spriteClimb;
				image_speed = speedClimb;
		    }
		}
	}
	
	_total_xspeed = global.xspeed + global.xforce;
	_total_yspeed = global.yspeed + global.yforce;


	//Blinking animation
	if sprite_index == asset_get_index("spr" + global.sprName + "Stand") || (asset_get_index("spr" + global.sprName + "StandBlink") != -1 and sprite_index == asset_get_index("spr" + global.sprName + "StandBlink")) { //Don't use spriteStand as this could also be sprMegamanStandShoot!
	    blinkTimer++;
	    if blinkImage == 0 {
	        if blinkTimer >= blinkTimerMax {
	            blinkImage = 1;
	            blinkTimer = 0;
	        }
	    }
	    else {
	        if blinkTimer >= blinkDuration {
	            blinkImage = 0;
	            blinkTimer = 0;
	        }
	    }
	}
	else {
	    blinkTimer = 0;
	    blinkImage = 0;
	}


	//Sidestepping
	var turned = false;
	if isStep {
    
		var _resetStep = false;
		if (global.keyLeftPressed and !global.keyRight) || (global.keyRightPressed and !global.keyLeft) {
			_resetStep = true;
			cancelStep = false;
			stepTimer = 0;
		}
	
		if !cancelStep {
			
			var isTurnaround = image_xscale != prevXScale;
			var stepComplete = false;
				
			if !place_meeting(x+image_xscale, y, objSolid) && !place_meeting(x+image_xscale, y, prtMovingPlatformSolid) {
				if (stepSpeed * stepFrames) mod 1 == 0 && (!place_meeting(x, y+1, objIce) or abs(iceAccWalk) >= abs(walkSpeed))
					x = round(x);
				if (canTurnaroundStep || !isTurnaround) {
					if (!place_meeting(x, y+1, objIce) or abs(iceAccWalk) >= abs(walkSpeed))
						global.xspeed = (stepSpeed * image_xscale) * stepFrames;
					else
						global.xspeed = ((stepSpeed * image_xscale) * stepFrames) / (abs(walkSpeed) / abs(iceAccWalk));
					stepComplete = true;
				}
			}
			else if place_meeting(x+image_xscale, y, prtMovingPlatformSolid) {
				if instance_place(x+image_xscale, y, prtMovingPlatformSolid).dead == true { //Still allow movement when the moving platform is despawned
					if (stepSpeed * stepFrames) mod 1 == 0 && (!place_meeting(x, y+1, objIce) or abs(iceAccWalk) >= abs(walkSpeed))
						x = round(x);
					if (canTurnaroundStep || !isTurnaround) {
						if (!place_meeting(x, y+1, objIce) or abs(iceAccWalk) >= abs(walkSpeed))
							global.xspeed = (stepSpeed * image_xscale) * stepFrames;
						else
							global.xspeed = ((stepSpeed * image_xscale) * stepFrames) / (abs(walkSpeed) / abs(iceAccWalk));
						stepComplete = true;
					}
				}
			}
			if isTurnaround {
				if stepComplete
					x -= global.xspeed;
				if !canTurnaroundStep {
					if (stepSpeed * stepFrames) mod 1 == 0 && (!place_meeting(x, y+1, objIce) or abs(iceAccWalk) >= abs(walkSpeed))
						x = round(x) - image_xscale;
					else
						x -= image_xscale;
					turned = true;
				}
			}
			cancelStep = true;
		}
		//else 
		//{
		//	global.xspeed = 0;
		//}
		///---Comment this out and uncomment the above if you want sidestepping to still function normally even when MM is on ice.---///
		else if !place_meeting(x, y+1, objIce)
	    {
	        //Normal physics
	        global.xspeed = 0;
	    }
	    else if !_frictionApplied
	    {
	        //Ice physics
	        if global.xspeed > 0
	            global.xspeed -= iceDec;
	        else if global.xspeed < 0
	            global.xspeed += iceDec;
                    
	        if global.xspeed > -iceDec && global.xspeed < iceDec
	            global.xspeed = 0;
	    }
		///--------------------------------------------------------------------------------------------------------------------------///
	
	    if canSpriteChange {
			if sprite_index == spriteStep && _resetStep {
		        sprite_index = spriteStand;
				image_speed = speedStand;
			}
			else {
				sprite_index = spriteStep;
				image_speed = speedStep;
			}
		}
    
	    stepTimer++;
	    if stepTimer >= stepFrames {
	        isStep = false;
	        stepTimer = 0;
	    }
	}


	//Save position to roll back to if necessary
	if rollbackMovement
	{
		var __old_x = x;
		var __old_y = y;
	}
	
	
	//Allow movement
	_total_xspeed = global.xspeed + global.xforce;
	_total_yspeed = global.yspeed + global.yforce;
	move(_total_xspeed, _total_yspeed);
	_total_xspeed = global.xspeed + global.xforce;
	_total_yspeed = global.yspeed + global.yforce;
	
	
	//If Beat physics are enabled, roll back our position and reset the collision bools
	if rollbackMovement
	{
		if (_total_xspeed > 0 and againstWallRight) || (_total_xspeed < 0 and againstWallLeft)
		{
			x = __old_x;
		}
		if (_total_yspeed > 0 and againstGround) || (_total_yspeed < 0 and againstCeiling)
		{
			y = __old_y;
		}
		againstGround = false;
		againstWallLeft = false;
		againstWallRight = false;
		againstCeiling = false;
	}
	
	
	//This (temporarily) fixes a glitch where MM's x-position is rounded/shuffled awkwardly when moving in integer steps while his x-position has a remainder of exactly 0.5
	//Seems to occur in the official games (MM9 & 10, at least) though, so comment this out if you wish
	if x mod 1 == 0.5 && (global.xspeed + pltSpeedX) mod 1 == 0
	{
		x += 0.000005 * sign(image_xscale);
	}


	//Avoids free movement on screen above
	if (!ground && !climbing && !instance_exists(objSectionSwitcher) && sprite_get_bottom() < sectionTop && _total_yspeed <= -currentJumpSpeed) {
	    y = sectionTop - sprite_height;
	}


	//Stop movement at section borders
	var endBeatCheck = false;
	if ((canMove or (instance_exists(objBeat) and objBeat.transportTimer < objBeat.transportTime)) || isSlide || isHit || isStun) && (visible or (instance_exists(objBeat) and objBeat.transportTimer < objBeat.transportTime)) {
	    if x > sectionRight-(7 - (image_xscale < 0)) && ((!place_meeting(x+(7 - (image_xscale < 0)), y, objSectionArrowRight) && !place_meeting(x-_total_xspeed, y, objSectionArrowRight)) or (instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)) {
	        x = sectionRight-(7 - (image_xscale < 0));
	        global.xspeed = 0;
	    }
	    else if x < sectionLeft+(7 - (image_xscale > 0)) && ((!place_meeting(x-(7 - (image_xscale > 0)), y, objSectionArrowLeft) && !place_meeting(x-_total_xspeed, y, objSectionArrowLeft)) or (instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)) {
	        x = sectionLeft+(7 - (image_xscale > 0));
	        global.xspeed = 0;
	    }    
	    if y < sectionTop - sprite_height {
	        y = sectionTop - sprite_height;
	    }
	    else if bbox_top > sectionBottom && !place_meeting(x, y, objSectionArrowDown) {
			
			canHit = false;
			
			if !instance_exists(objBeat) || objBeat.transportTimer >= objBeat.transportTime {
				if objBeatEquip.count < 1 {
					global._health = 0;
					deathByPit = true;
				}
				else if global._health > 0 && !dead {
					objBeatEquip.count--;
					
					//var _ceil = abs(bbox_top-round(global.viewY+global.viewHeight))+1;
					//var _attempts = 0;
					//var _old_x = x;
					//while !place_free(x, y-_ceil) && _attempts < 500
					//{
					//	if abs(global.xspeed) >= 1
					//	{
					//		x -= global.xspeed;
					//		_attempts += abs(global.xspeed);
					//	}
					//	else
					//	{
					//		if (instance_place(x, y-_ceil, objSolid) >= 0 && sprite_get_xcenter_object(instance_place(x, y-_ceil, objSolid))) >= x
					//		|| (instance_place(x, y-_ceil, prtMovingPlatformSolid) >= 0 && !instance_place(x, y-_ceil, prtMovingPlatformSolid).dead && sprite_get_xcenter_object(instance_place(x, y-_ceil, prtMovingPlatformSolid))) >= x
					//		{
					//			x -= 1;
					//			_attempts++;
					//		}
					//		else if (instance_place(x, y-_ceil, objSolid) >= 0 && sprite_get_xcenter_object(instance_place(x, y-_ceil, objSolid))) < x
					//		|| (instance_place(x, y-_ceil, prtMovingPlatformSolid) >= 0 && !instance_place(x, y-_ceil, prtMovingPlatformSolid).dead && sprite_get_xcenter_object(instance_place(x, y-_ceil, prtMovingPlatformSolid))) < x
					//		{
					//			x += 1;
					//			_attempts++;
					//		}
					//	}
					//}
					//if !place_free(x, y-_ceil)
					//	x = _old_x;
					
					global.xspeed = 0;
					if y >= round((global.viewY+global.viewHeight)+30)
					{
						y = round((global.viewY+global.viewHeight)+30);
						global.yspeed = 0;
					}
					
					if isStun
					{
						stunTimer = 0;
						isStun = false;
						canMove = true;
						canWalk = true;
					}
			
					if isSlide
					{
						slideTimer = 0;
						isSlide = false;
					    canMove = true;
						canWalk = true;
					}
			
					if climbing
					{
						climbing = false;
						canMove = true;
					}
					
					isShoot = false;
					isThrow = false;
					
					isDash = false;
			
					canSpriteChange = false;
					isFly = true;
					flying = true;
					playerHandleSprites();
					mask_index = mskMegaman;
					sprite_index = spriteJump;
					image_speed = speedJump;
						
					//instance_deactivate_object(self.id);
					canMove = false;
					
					if !instance_exists(objBeat)
					{
						var myBeat = instance_create(x, round(global.viewY-3), objBeat);
						with myBeat target = other.id;
						with myBeat event_user(0);
					}
					else
					{
						objBeat.transportTimer = 0;
						with objBeat target = other.id;
						with objBeat event_user(0);
					}
					endBeatCheck = true;
				}
				
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
			//else if !objBeat.carrying {
			//	global.xspeed = 0;
			//	if y > round((global.viewY+global.viewHeight)+30)
			//	{
			//		y = round((global.viewY+global.viewHeight)+30);
			//		global.yspeed = 0;
					
			//		if isStun
			//		{
			//			stunTimer = 0;
			//			isStun = false;
			//			canMove = true;
			//			canWalk = true;
			//		}
			
			//		if isSlide
			//		{
			//			slideTimer = 0;
			//			isSlide = false;
			//		    canMove = true;
			//			canWalk = true;
			//		}
			
			//		if climbing
			//		{
			//			climbing = false;
			//			canMove = true;
			//		}
			
			//		canSpriteChange = false;
			//		mask_index = mskMegaman;
			//		sprite_index = spriteJump;
			//		image_speed = speedJump;
						
			//		instance_deactivate_object(self.id);
			//	}
			//	canMove = false;
			//}
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
	else if bbox_top > room_height
	{
	    if !instance_exists(objBeat) || objBeat.transportTimer >= objBeat.transportTime {
			
			canHit = false;
			
			if objBeatEquip.count < 1 {
				global._health = 0;
				deathByPit = true;
			}
			else if global._health > 0 && !dead && !endBeatCheck {
				objBeatEquip.count--;
				
				//var _ceil = abs(bbox_top-round(global.viewY+global.viewHeight))+1;
				//var _attempts = 0;
				//var _old_x = x;
				//while !place_free(x, y-_ceil) && _attempts < 500
				//{
				//	if abs(global.xspeed) >= 1
				//	{
				//		x -= global.xspeed;
				//		_attempts += abs(global.xspeed);
				//	}
				//	else
				//	{
				//		if (instance_place(x, y-_ceil, objSolid) >= 0 && sprite_get_xcenter_object(instance_place(x, y-_ceil, objSolid))) >= x
				//		|| (instance_place(x, y-_ceil, prtMovingPlatformSolid) >= 0 && !instance_place(x, y-_ceil, prtMovingPlatformSolid).dead && sprite_get_xcenter_object(instance_place(x, y-_ceil, prtMovingPlatformSolid))) >= x
				//		{
				//			x -= 1;
				//			_attempts++;
				//		}
				//		else if (instance_place(x, y-_ceil, objSolid) >= 0 && sprite_get_xcenter_object(instance_place(x, y-_ceil, objSolid))) < x
				//		|| (instance_place(x, y-_ceil, prtMovingPlatformSolid) >= 0 && !instance_place(x, y-_ceil, prtMovingPlatformSolid).dead && sprite_get_xcenter_object(instance_place(x, y-_ceil, prtMovingPlatformSolid))) < x
				//		{
				//			x += 1;
				//			_attempts++;
				//		}
				//	}
				//}
				//if !place_free(x, y-_ceil)
				//	x = _old_x;
				
				global.xspeed = 0;
				if y >= round((global.viewY+global.viewHeight)+30)
				{
					y = round((global.viewY+global.viewHeight)+30);
					global.yspeed = 0;
				}
					
				if isStun
				{
					stunTimer = 0;
					isStun = false;
					canMove = true;
					canWalk = true;
				}
			
				if isSlide
				{
					slideTimer = 0;
					isSlide = false;
				    canMove = true;
					canWalk = true;
				}
			
				if climbing
				{
					climbing = false;
					canMove = true;
				}
					
				isShoot = false;
				isThrow = false;
				
				isDash = false;
			
				canSpriteChange = false;
				isFly = true;
				flying = true;
				playerHandleSprites();
				mask_index = mskMegaman;
				sprite_index = spriteJump;
				image_speed = speedJump;
					
				//instance_deactivate_object(self.id);
				canMove = false;
				
				if !instance_exists(objBeat)
				{
					var myBeat = instance_create(x, round(global.viewY-3), objBeat);
					with myBeat target = other;
					with myBeat event_user(0);
				}
				else
				{
					objBeat.transportTimer = 0;
					with objBeat target = other;
					with objBeat event_user(0);
				}
			}
			
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
		//else if !objBeat.carrying {
		//	global.xspeed = 0;
		//	if y > round((global.viewY+global.viewHeight)+30)
		//	{
		//		y = round((global.viewY+global.viewHeight)+30);
		//		global.yspeed = 0;
				
		//		if isStun
		//		{
		//			stunTimer = 0;
		//			isStun = false;
		//			canMove = true;
		//			canWalk = true;
		//		}
			
		//		if isSlide
		//		{
		//			slideTimer = 0;
		//			isSlide = false;
		//		    canMove = true;
		//			canWalk = true;
		//		}
			
		//		if climbing
		//		{
		//			climbing = false;
		//			canMove = true;
		//		}
			
		//		canSpriteChange = false;
		//		mask_index = mskMegaman;
		//		sprite_index = spriteJump;
		//		image_speed = speedJump;
					
		//		instance_deactivate_object(self.id);
		//	}
		//	canMove = false;
		//}
	}
	
	_total_xspeed = global.xspeed + global.xforce;
	_total_yspeed = global.yspeed + global.yforce;
	
	


	//Jumping
	var _shouldJump = (cfgEnableBuffering and global.keyJump and !global.hasJumped and room != rmWeaponGet) || global.keyJumpPressed;
	if _shouldJump
	{
		if (!locked && !showReady && !teleporting && !landing) && !instance_exists(objChargeKick) global.hasJumped = true;
		
		if (canMove || (isThrow and room != rmWeaponGet) || (onRushJet and room != rmWeaponGet)) && ((ground and canJump) or jumps < maxJumps) && place_free(x, y-2) && (!global.keyDown || onRushJet)
		{
		    if ((isThrow or isShoot) and !global.weapons[global.currentWeapon].freeShot) {  //We can jump-cancel the throwing animation (after throwing a Metal Blade, Pharaoh Shot etc)
		        canMove = true;
		        canSpriteChange = true;
		        shootTimer -= 5; //20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
		    }
		    else if onRushJet {
		        canMove = true;
		    }
    
		    global.yspeed = -currentJumpSpeed;
			_total_yspeed = global.yspeed + global.yforce;
		    ground = false;
			canJump = false;
			jumps++;
		    canMinJump = true;
		    y -= 1; //To negate the prevGround y += 1
		    sprite_index = spriteJump;
			image_speed = speedJump;
		}
	}


	//Minjumping (lowering jump when the jump button is released)
	if ground == false && global.yspeed < 0 && !global.keyJump && canMinJump == true
	{
	    canMinJump = false;
	    global.yspeed = 0;
		_total_yspeed = global.yspeed + global.yforce;
	}


	//Sliding (or dashing)
	var _shouldSlide = global.enableSlideKey && ((cfgEnableBuffering and global.keySlide and !global.hasSlid and room != rmWeaponGet) or global.keySlidePressed);
	
	var box;
	if image_xscale == 1
	    box = bbox_right;
	else
	    box = bbox_left;
	
	if (enableSlide or global.weapons[global.currentWeapon].newID == objChargeKickWeapon.newID or instance_exists(objChargeKick)) {
		
		var _spd, _frames, _spr, _fr, _msk;
		if !enableDash or global.weapons[global.currentWeapon].newID == objChargeKickWeapon.newID or instance_exists(objChargeKick)
		{
			_spd = slideSpeed;
			_frames = slideFrames;
			_spr = spriteSlide;
			_fr = speedSlide;
			_msk = mskMegamanSlide;
		}
		else
		{
			_spd = dashSpeed;
			_frames = dashFrames;
			_spr = spriteDash;
			_fr = speedDash;
			_msk = mskMegamanDash;
		}
		
		var canDash = (enableDash && global.weapons[global.currentWeapon].newID != objChargeKickWeapon.newID && !instance_exists(objChargeKick));
		
		if ((_shouldJump && global.keyDown) || _shouldSlide)
		&& !(image_xscale > 0 && (((x+_spd) > sectionRight-(7 - (image_xscale < 0)) && !place_meeting(x+(7 - (image_xscale < 0)), y, objSectionArrowRight) && !place_meeting(x-_total_xspeed, y, objSectionArrowRight)) || (x+_spd > room_width-(7 - (image_xscale < 0)))))
		&& !(image_xscale < 0 && (((x-_spd) < sectionLeft+(7 - (image_xscale > 0)) && !place_meeting(x-(7 - (image_xscale > 0)), y, objSectionArrowLeft) && !place_meeting(x-_total_xspeed, y, objSectionArrowLeft)) || (x-_spd < (7 - (image_xscale > 0)))))
	    {
			if (_shouldJump && global.keyDown && !instance_exists(objChargeKick)) && (!locked && !showReady && !teleporting && !landing) global.hasJumped = true;
			if (_shouldSlide && !instance_exists(objChargeKick)) && (!locked && !showReady && !teleporting && !landing) global.hasSlid = true;
			
			if ground && !isSlide
		        && (canMove || (isThrow and room != rmWeaponGet)) && !position_meeting(box+image_xscale*(5+(3*canDash)), bbox_bottom-(8+(10*canDash)), objSolid)
				&& !onRushJet
			{
		        var canSld = false;
        
		        if !position_meeting(box+image_xscale*(5+(3*canDash)), bbox_bottom-(8+(10*canDash)), prtMovingPlatformSolid) {
		            canSld = true;
		        }
		        else {
					if !position_meeting(box+image_xscale*(5+(3*canDash)), bbox_bottom-(8+(10*canDash)), prtMovingPlatformSolid)
						canSld = true;
		            else if instance_position(box+image_xscale*(5+(3*canDash)), bbox_bottom-(8+(10*canDash)), prtMovingPlatformSolid).dead == true //We can still slide if the moving platform is despawned
		                canSld = true;
		        }
        
        
		        if canSld {
		            if isThrow {
		                isThrow = false;
		                shootTimer -= 5; //20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
		            }
					if isShoot {
		                isShoot = false;
		                shootTimer -= 5; //20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
		            }
            
		            isSlide = true;
		            canMove = false;
					canWalk = false;
		            canSpriteChange = false;
					isDash = canDash;
		            sprite_index = _spr;
		            mask_index = _msk;
            
		            if image_xscale == -1
		                with instance_create(bbox_right-dust_xoffset, bbox_bottom-dust_yoffset, objSlideDust) image_xscale = -1;
		            else
		                instance_create(bbox_left+dust_xoffset, bbox_bottom-dust_yoffset, objSlideDust);
            
					//Updated wall escape code. Previous version of the code results in zips through tight gaps.
					var endLoop, attempts;
		            endLoop = false;
					attempts = 0;
		            while (place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)) && endLoop == false && attempts < abs(round((sprite_get_width(mask_index) * image_xscale) / 2))
		            {
		                if !place_meeting(x, y, objSolid) && place_meeting(x, y, prtMovingPlatformSolid)
		                {
		                    if instance_place(x, y, prtMovingPlatformSolid).dead == true
		                        endLoop = true;
		                }
                
		                x += image_xscale;
						attempts++;
		            }
					if (place_meeting(x, y, objSolid) || (place_meeting(x, y, prtMovingPlatformSolid) and !instance_place(x, y, prtMovingPlatformSolid).dead)) && !endLoop
					{
						x -= attempts * image_xscale;
						print("BACK");
					}
					//
			
		            /*while position_meeting(x, y+5, objSolid) || (position_meeting(x, y+5, prtMovingPlatformSolid) && !instance_position(x, y+5, prtMovingPlatformSolid).dead) {
		                x += image_xscale;
		            }*/
            
		            global.xspeed = slideSpeed * image_xscale;
					_total_xspeed = global.xspeed + global.xforce;
		        }
			}
	    }
    
    
	    //While sliding
	    if isSlide {
	        image_speed = _fr;
	        isStep = false;
	        canInitStep = false;
			stepTimer = 0;
			cancelStep = false;
	        slideTimer++;
        
	        var canProceed = true;
        
			print("Meeting: " + string(place_meeting(x, y-1, objSolid) or place_meeting(x, y-1, prtMovingPlatformSolid)))
		
	        if (place_meeting(x, y-(7+(2*canDash)), objSolid) || place_meeting(x, y-(7+(2*canDash)), prtMovingPlatformSolid)) && (ground == true || place_meeting(x-(_spd-1), y+1, objSolid) || place_meeting(x-(_spd-1), y+1, objTopSolid) || place_meeting(x-(_spd-1), y+1, prtMovingPlatformJumpthrough) || place_meeting(x-(_spd-1), y+1, prtMovingPlatformSolid)
	        || place_meeting(x+(_spd-1), y, objSolid) || place_meeting(x+(_spd-1), y, prtMovingPlatformSolid)) //Extra check because if Mega Man falls down while sliding and a wall is on the other side of him and a ceiling is on top of him, when turning around on the right frame he would zip through the solids
	        {   
				if place_meeting(x-(_spd-1), y+1, objTopSolid)
	            {
					//This fixes a glitch where sliding under a solid ceiling with topsolids underneath allows us to infinitely fly under those ceilings.
					var tpsld, totalTSs, endCheck;
					tpsld = instance_place(x-(_spd-1), y+1, objTopSolid);
					totalTSs = 0;
					endCheck = false;
					
					while tpsld >= 0 && !endCheck
					{
						if bbox_bottom <= tpsld.bbox_top
						{
							endCheck = true;
						}
						
						pltID[totalTSs] = tpsld;
						instance_deactivate_object(tpsld);
						totalTSs += 1;
						tpsld = instance_place(x-(_spd-1), y+1, objTopSolid);
					}
					if !endCheck && !(ground == true || place_meeting(x-(_spd-1), y+1, objSolid) || (place_meeting(x-(_spd-1), y+1, prtMovingPlatformSolid) and !instance_place(x-(_spd-1), y+1, prtMovingPlatformSolid).dead))
						canProceed = false;
    
					var i;
					for(i = 0; i < totalTSs; i += 1)
						instance_activate_object(pltID[i]);
	            }
	            if place_meeting(x, y-(7+(2*canDash)), prtMovingPlatformSolid)
	            {
	                if instance_place(x, y-(7+(2*canDash)), prtMovingPlatformSolid).dead == true
	                    canProceed = false;
	            }
	            if place_meeting(x-(_spd-1), y+1, prtMovingPlatformSolid)
	            {
	                if instance_place(x-(_spd-1), y+1, prtMovingPlatformSolid).dead == true
						canProceed = false;
	            }
	            if place_meeting(x+(_spd-1), y, prtMovingPlatformSolid)
	            {
	                if instance_place(x+(_spd-1), y, prtMovingPlatformSolid).dead == true
	                    canProceed = false;
	            }
	            if place_meeting(x-(_spd-1), y+1, prtMovingPlatformJumpthrough)
	            {
	                //This fixes a glitch where sliding under a solid ceiling with moving topsolids underneath allows us to infinitely fly under those ceilings.
					var pltfm, totalPlatforms, endCheck;
				    pltfm = instance_place(x-(_spd-1), y+1, prtMovingPlatformJumpthrough);
				    totalPlatforms = 0;
					endCheck = false;
				    while pltfm >= 0 && !endCheck
				    {
						if pltfm.dead == false
				        {
				            if bbox_bottom <= pltfm.bbox_top
				            {
								endCheck = true;
				            }
						}
        
				        pltID[totalPlatforms] = pltfm;
				        instance_deactivate_object(pltfm);
				        totalPlatforms += 1;
				        pltfm = instance_place(x-(_spd-1), y+1, prtMovingPlatformJumpthrough);
				    }
					if !endCheck && !(ground == true || place_meeting(x-(_spd-1), y+1, objSolid) || (place_meeting(x-(_spd-1), y+1, prtMovingPlatformSolid) and !instance_place(x-(_spd-1), y+1, prtMovingPlatformSolid).dead))
						canProceed = false;
		
				    for(var i = 0; i < totalPlatforms; i += 1)
				        instance_activate_object(pltID[i]);
	            }
            
	            if canProceed
				&& !(image_xscale > 0 && (x > sectionRight-(7 - (image_xscale < 0)) && place_meeting(x-_total_xspeed+(7 - (image_xscale < 0)), y, objSectionArrowRight) && !collision_rectangle(sectionRight+1, bbox_top, sectionRight+2, bbox_bottom, objSolid, false, false)))
				&& !(image_xscale < 0 && (x < sectionLeft+(7 - (image_xscale > 0)) && place_meeting(x-_total_xspeed-(7 - (image_xscale > 0)), y, objSectionArrowLeft) && !collision_rectangle(sectionLeft-1, bbox_top, sectionLeft-2, bbox_bottom, objSolid, false, false)))
				{
	                if global.keyLeft && !global.keyRight && (!instance_exists(objChargeKick) or image_xscale == -1 or ((!place_free(x+(_spd-1), y) or x >= sectionRight-(7 - (image_xscale < 0)) or x >= room_width-(7 - (image_xscale < 0))) and !place_free(x, y-(7+(2*canDash)))))
	                {
	                    image_xscale = -1;
	                    global.xspeed = -_spd;
						_total_xspeed = global.xspeed + global.xforce;
	                }
	                else if global.keyRight && !global.keyLeft && (!instance_exists(objChargeKick) or image_xscale == 1 or ((!place_free(x-(_spd-1), y) or x <= sectionLeft+(7 - (image_xscale > 0)) or x <= (7 - (image_xscale > 0))) and !place_free(x, y-(7+(2*canDash)))))
	                {
	                    image_xscale = 1;
	                    global.xspeed = _spd;
						_total_xspeed = global.xspeed + global.xforce;
	                }
                
	                ground = true;  //For the bugfix as explained on the second line of the place_meeting checks
				}
	        }
	        else
	        {
	            canProceed = false;
	        }
        
        
	        if !canProceed {
	            if !ground || (global.keyLeft && !global.keyRight && image_xscale == 1 && !instance_exists(objChargeKick))
	            || (global.keyRight && !global.keyLeft && image_xscale == -1 && !instance_exists(objChargeKick))
	            || slideTimer >= _frames || (_shouldJump && !global.keyDown && !instance_exists(objChargeKick))
	            || place_meeting(x+image_xscale*3, y, objSolid) || place_meeting(x+image_xscale*3, y, prtMovingPlatformSolid)
				|| (image_xscale > 0 && (((x+_spd) > sectionRight-(7 - (image_xscale < 0)) && !place_meeting((x+_spd)+(7 - (image_xscale < 0)), y, objSectionArrowRight) && !place_meeting(x-_total_xspeed, y, objSectionArrowRight)) || (x+_spd > room_width-(7 - (image_xscale < 0)))))
				|| (image_xscale < 0 && (((x-_spd) < sectionLeft+(7 - (image_xscale > 0)) && !place_meeting((x-_spd)-(7 - (image_xscale > 0)), y, objSectionArrowLeft) && !place_meeting(x-_total_xspeed, y, objSectionArrowLeft)) || (x-_spd < (7 - (image_xscale > 0)))))
	            {
					if (_shouldJump && !global.keyDown && !instance_exists(objChargeKick)) && (!locked && !showReady && !teleporting && !landing) global.hasJumped = true;
					
	                var stopSld = true;
                
	                if !ground || (global.keyLeft && !global.keyRight && image_xscale == 1 && !instance_exists(objChargeKick))
	                || (global.keyRight && !global.keyLeft && image_xscale == -1 && !instance_exists(objChargeKick))
	                || slideTimer >= _frames || (_shouldJump && !global.keyDown && !instance_exists(objChargeKick))
					|| (image_xscale > 0 && (((x+_spd) > sectionRight-(7 - (image_xscale < 0)) && !place_meeting((x+_spd)+(7 - (image_xscale < 0)), y, objSectionArrowRight) && !place_meeting(x-_total_xspeed, y, objSectionArrowRight)) || (x+_spd > room_width-(7 - (image_xscale < 0)))))
					|| (image_xscale < 0 && (((x-_spd) < sectionLeft+(7 - (image_xscale > 0)) && !place_meeting((x-_spd)-(7 - (image_xscale > 0)), y, objSectionArrowLeft) && !place_meeting(x-_total_xspeed, y, objSectionArrowLeft)) || (x-_spd < (7 - (image_xscale > 0)))))
	                || place_meeting(x+image_xscale*3, y, objSolid)
	                {
						if (_shouldJump && !global.keyDown && !instance_exists(objChargeKick)) && (!locked && !showReady && !teleporting && !landing) global.hasJumped = true;
	                    stopSld = true;
	                }
	                else if place_meeting(x+image_xscale*3, y, prtMovingPlatformSolid)
	                {
	                    if instance_place(x+image_xscale*3, y, prtMovingPlatformSolid).dead == true //We should not stop sliding if the moving platform is despawned
	                        stopSld = false;
	                }
                
	                if stopSld {
						
	                    var stopDash = true;
						
						isSlide = false;
	                    canMove = true;
						canWalk = true;
	                    canSpriteChange = true;
	                    mask_index = mskMegaman;
	                    slideTimer = 0;
						
						//You might wanna comment this out if you're not including Charge Kick (or similar) in your game, you might not I dunno...
						//----------------------------------------------------------------------------------------------------------------------//
						if ground == true
						{
						    if ((global.keyLeft && !global.keyRight) || (global.keyRight && !global.keyLeft))
						    {
								sprite_index = spriteWalk;
								image_speed = speedWalk;
							}
							else
							{
								sprite_index = spriteStand;
								image_speed = speedStand;
							}
						}
						else
						{
							sprite_index = spriteJump;
							image_speed = spriteJump;
						}
						
						if global.keyLeft && !global.keyRight
							image_xscale = -1;
						else if global.keyRight && !global.keyLeft
							image_xscale = 1;
						//----------------------------------------------------------------------------------------------------------------------//
                    
	                    var endLoop = false;
					
	                    //Pushing down until not inside a ceiling anymore
	                    while (place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)) && endLoop == false      //If your slide cancels right under a ceiling, move MM down
	                    {
	                        if !place_meeting(x, y, objSolid) && place_meeting(x, y, prtMovingPlatformSolid)
	                        {
	                            if instance_place(x, y, prtMovingPlatformSolid).dead == true
	                                endLoop = true;
	                        }
                        
	                        if !endLoop {
	                            y++;
	                            sprite_index = spriteJump;
								image_speed = speedJump;
	                            ground = false;
								canJump = false;
								if jumps < 1 jumps = 1;
								stopDash = false;
	                        }
	                    }
                        
	                    if !place_meeting(x, y+1, objIce)
	                        global.xspeed = 0;
	                    else
	                        global.xspeed = walkSpeed * image_xscale;
                    
	                    if _shouldJump && !global.keyDown && !instance_exists(objChargeKick)
	                    {
							if (!locked && !showReady && !teleporting && !landing) global.hasJumped = true;
							
							if jumps < maxJumps && place_free(x, y-2)
							{
		                        global.yspeed = -jumpSpeed;
		                        ground = false;
								canJump = false;
								if jumps < 1 jumps = 1;
								global.canBufferJump = false;
		                        y -= 1; //To negate the prevGround y += 1
								sprite_index = spriteJump;
								image_speed = speedJump;
								stopDash = false;
							}
	                    }
						
						if stopDash
							isDash = false;
						
						_total_xspeed = global.xspeed + global.xforce;
						_total_yspeed = global.yspeed + global.yforce;
	                }
	            }
	        }
	    }
	    else
	    {
	        slideTimer = 0;
	    }
	}


	//Climbing
	var ladder, ladderDown;
	ladder = collision_rectangle(sprite_get_xcenter()-3, bbox_top+4, sprite_get_xcenter()+3, bbox_bottom-1, objLadder, false, false);
	ladderDown = collision_rectangle(sprite_get_xcenter()-1, bbox_bottom+1, sprite_get_xcenter()+1, bbox_bottom+2, objLadder, false, false);
	if ((ladder >= 0 && global.keyUp && !global.keyDown) || (ladderDown >= 0 && global.keyDown && !global.keyUp)) && (canMove == true || isSlide == true) && !climbing {
		var solidDown = collision_rectangle(sprite_get_xcenter()-1, bbox_bottom+1, sprite_get_xcenter()+1, bbox_bottom+2, objSolid, false, false);
		var movingSolidDown = collision_rectangle(sprite_get_xcenter()-1, bbox_bottom+1, sprite_get_xcenter()+1, bbox_bottom+2, prtMovingPlatformSolid, false, false);
		var solidAbove = false;
		if (ladderDown >= 0) {
		    with ladderDown {
				for (var i = 1; i < 15; i++) {
					if !collision_rectangle_free(bbox_left+2, bbox_top - i, bbox_left+15, bbox_top + 16 - i, false, true, true) {
						solidAbove = true;
						break;
					}
				}
				var _jumpThrough = collision_rectangle(bbox_left+2, bbox_top+5, bbox_left+15, bbox_top+15, prtMovingPlatformJumpthrough, false, true);
				if _jumpThrough >= 0 and _jumpThrough.bbox_top >= bbox_top+5 {
					solidAbove = true;
				}
		    }
		}
	
		if ((ladder >= 0 && collision_rectangle_free(ladder.bbox_left+2, bbox_top, ladder.bbox_left+15, bbox_bottom, false, true, true) && global.keyUp && !global.keyDown)
		|| (ladderDown >= 0 and solidDown < 0 and movingSolidDown < 0 and !solidAbove and ground and !isSlide and global.keyDown and !global.keyUp))
		&& sprite_get_ycenter() >= sectionTop + 7 && sprite_get_ycenter() <= sectionBottom - 7
		&& (canMove == true || isSlide == true) {
			isSlide = false;
			isDash = false;
			mask_index = mskMegamanClimb;
			slideTimer = 0;
    
			climbing = true;
			canMove = false;
			canWalk = false;
			canSpriteChange = false;
			canGravity = false;
    
			global.xspeed = 0;
			global.yspeed = 0;
		
			_total_xspeed = global.xspeed + global.xforce;
			_total_yspeed = global.yspeed + global.yforce;
    
			if ladder >= 0 && global.keyUp && !global.keyDown
			    x = ladder.x+8;
			else if ladderDown >= 0
			{
			    x = ladderDown.x+8;
			    y += climbSpeed * 2 + 2;
			    ground = false;
				canJump = false;
				if jumps < 1 jumps = 1;
			}
    
			sprite_index = spriteClimb;
			image_speed = speedClimb;
		
			if y < -sprite_height
				y = -sprite_height;
    
			ladderXScale = image_xscale;
			climbShootXscale = ladderXScale;
		}
	}


	//While climbing
	if climbing == true
	{
	    isStep = false;
	    canInitStep = false;
		stepTimer = 0;
		cancelStep = false;

	    //Movement
	    if global.keyUp && !global.keyDown && isShoot == false && isThrow == false
	    {
	        climbSpriteTimer += 1;
	        global.yspeed = -climbSpeed;
	    }
	    else if global.keyDown && !global.keyUp && isShoot == false && isThrow == false
	    {
	        climbSpriteTimer += 1;
	        global.yspeed = climbSpeed;
	    }
	    else
	    {
	        global.yspeed = 0;
	    }
		
		_total_yspeed = global.yspeed + global.yforce;
    
	    //Left/right
	    if global.keyRight && !global.keyLeft
	        climbShootXscale = 1;
	    else if global.keyLeft && !global.keyRight
	        climbShootXscale = -1;
    
	    if climbSpriteTimer >= 8 && sprite_index == spriteClimb && isShoot == false && isThrow == false
	    {
	        climbSpriteTimer = 0;
	        image_xscale = -image_xscale;
	    }
    
	    //Getup sprite
	    if !position_meeting(x, bbox_top+11, objLadder) && position_meeting(x, bbox_bottom+1, objLadder) //The second check is to make sure the getup animation is not shown when on the BOTTOM of a ladder that's placed in the air
	    {
	        sprite_index = spriteGetup;
			image_speed = speedGetup;
	        if sprite_index == spriteGetupDefault //not when shooting
	            image_xscale = 1;
	    }
	    else
	    {
	        sprite_index = spriteClimb;
			image_speed = speedClimb;
	    }
		
		if y < -sprite_height
			y = -sprite_height;
    
	    //Releasing the ladder
	    if (ground == true && global.keyDown) || !place_meeting(x, y, objLadder) || (_shouldJump && !global.keyUp)
	    {
			mask_index = mskMegaman;
			if (_shouldJump && !global.keyUp) && (!locked && !showReady && !teleporting && !landing) global.hasJumped = true;
	        climbing = false;
	        canMove = true;
			canJump = true;
			jumps = 0;
			if (!isShoot and !isThrow) or global.weapons[global.currentWeapon].freeShot
			{
				canWalk = true;
			}
	        canSpriteChange = true;
	        canGravity = true;
	        image_xscale = ladderXScale;
	        global.yspeed = 0;
        
	        if position_meeting(x, bbox_bottom+15, objTopSolid) || ground == true {
				
				if position_meeting(x, bbox_bottom+climbSpeed, objSolid) {
					var mySolid = instance_position(x, bbox_bottom+climbSpeed, objSolid);
					y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
				}
				else if position_meeting(x, bbox_bottom+climbSpeed, objTopSolid) {
					var mySolid = instance_position(x, bbox_bottom+climbSpeed, objTopSolid);
					y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
				}
				else if position_meeting(x, bbox_bottom+climbSpeed, prtMovingPlatformSolid) {
					var mySolid = instance_position(x, bbox_bottom+climbSpeed, prtMovingPlatformSolid);
					y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
				}
				else if position_meeting(x, bbox_bottom+climbSpeed, prtMovingPlatformJumpthrough) {
					var mySolid = instance_position(x, bbox_bottom+climbSpeed, prtMovingPlatformJumpthrough);
					y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
				}
				
	            ground = true;  //To avoid "falling" after climbing (shouldn't play the landing sfx)
				canJump = true;
				jumps = 0;
	            if (global.keyRight && !global.keyLeft) || (global.keyLeft && !global.keyRight) {
	                sprite_index = spriteWalk;
					image_speed = speedWalk;
                
	                if global.keyRight {
	                    global.xspeed = walkSpeed;
	                    image_xscale = 1;
	                }
	                else if global.keyLeft {
	                    global.xspeed = -walkSpeed;
	                    image_xscale = -1;
	                }
	            }
	            else {
	                sprite_index = spriteStand;
					image_speed = speedStand;
	            }
	        }
	        else {
	            sprite_index = spriteJump;
				image_speed = speedJump;
	        }
        
	        if !place_meeting(x, y+1, objLadder)
	        {
	            var topSolidID;
	            topSolidID = instance_place(x, y+2, objTopSolid);
	            if topSolidID >= 0
	                y = topSolidID.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index)) + (sprite_get_height(mask_index) - sprite_get_bbox_bottom(mask_index)) - 1;
                
				canJump = true;
				jumps = 0;
	            playLandSound = false;
	            playLandSoundTimer = 0;
	        }
			
			_total_xspeed = global.xspeed + global.xforce;
			_total_yspeed = global.yspeed + global.yforce;
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
		    if bbox_bottom <= currentWater.bbox_top+_total_yspeed+1
			&& currentWater.bbox_top < sectionBottom
			&& currentWater.bbox_top > sectionTop
		    {
				instance_create(x, currentWater.bbox_top+1, objSplash);
				playSFX(sfxSplash);
		    }
			else if bbox_top >= currentWater.bbox_bottom+_total_yspeed-1
			&& currentWater.bbox_bottom < sectionBottom
			{
				var splash = instance_create(x, currentWater.bbox_bottom-1, objSplash);
				splash.image_yscale = -1;
				playSFX(sfxSplash);
			}
			if bbox_right <= currentWater.bbox_left+_total_xspeed+1
			&& currentWater.bbox_left > sectionLeft
			&& currentWater.bbox_left < sectionRight
		    {
				instance_create(currentWater.bbox_left+1, y, objSplashH);
				playSFX(sfxSplash);
		    }
			else if bbox_left >= currentWater.bbox_right+_total_xspeed-1
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
	    wtr = instance_place(x-_total_xspeed, y-_total_yspeed, objWater);
	    if wtr >= 0 && !place_meeting(x+sign(_total_xspeed), y+sign(_total_yspeed), objWater)
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


	//While being hit
	if isHit {
		
		//Just in case we get into a situation that results in the sprite and image speeds not matching when the hit animation is cancelled
		if sprite_index != spriteHit {
			
			if sprite_index == spriteStand
				image_speed = speedStand;
			else if sprite_index == spriteStep
				image_speed = speedStep;
			else if sprite_index == spriteJump
				image_speed = speedJump;
			else if sprite_index == spriteWalk
				image_speed = speedWalk;
			else if sprite_index == spriteSlide
				image_speed = speedSlide;
			else if sprite_index == spriteDash
				image_speed = speedDash;
			else if sprite_index == spriteStun
				image_speed = speedStun;
			else if sprite_index == spriteClimb
				image_speed = speedClimb;
			else if sprite_index == spriteGetup
				image_speed = speedGetup;
			else if sprite_index == spriteTeleport
				image_speed = speedTeleport;
			else if sprite_index == spriteLand
				image_speed = speedLand;
			else if sprite_index == spriteAbsorbTransition
				image_speed = speedAbsorbTransition;
			else if sprite_index == spriteAbsorb
				image_speed = speedAbsorb;
			
		}
		
	    hitTimer += 1;
	    if hitTimer >= hitTime {
	        isHit = false;
	        drawHitspark = false;
	        hitTimer = 0;
        
	        //When sliding and there's a solid above us, we should not experience knockback
	        //If we did, we would clip inside the ceiling above us
	        if !locked && !((isSlide or isStun) && (place_meeting(x, y-(7+(2*isDash)), objSolid) || place_meeting(x, y-(7+(2*isDash)), prtMovingPlatformSolid))) {
	            canMove = true;
				canWalk = true;
	            canSpriteChange = true;
				
				if isFly && !flying {
					flying = true;
				}
				if isRollback && !rollbackMovement {
					rollbackMovement = true;
				}
	        }
        
	        invincibilityTimer = invincibilityTime;
	    }
	    else {
	        if global._health > 0 && (hitTimer mod 4 == 0 or hitTimer mod 4 == 1)  //mod: modulo, %. Gives the remainder
	            drawHitspark = true;
	        else
	            drawHitspark = false;
			
			if knockbackAmount != 0
			{
				if image_xscale < 0 { _xc = clamp(abs(_total_xspeed), 0.5, 1); }
				else { _xc = clamp(abs(_total_xspeed), 0.500005, 1); }
			
				if (image_xscale >= 0 and !(bbox_left+_total_xspeed-_xc < sectionLeft or bbox_left+_total_xspeed-_xc < 0))
				|| (image_xscale < 0 and !(bbox_right+_total_xspeed+_xc > sectionRight or bbox_right+_total_xspeed+_xc > room_width))
				{
			        if !place_meeting(x-(_xc * image_xscale), y, objSolid) && !place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid)
			            global.xspeed = image_xscale * -knockbackAmount;
			        else if place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
			        {
			            if instance_place(x-(_xc * image_xscale), y, prtMovingPlatformSolid).dead == true
			                global.xspeed = image_xscale * -knockbackAmount;
			        }
				}
			}
			else
			{
				if !place_meeting(x, y+1, objIce)
					global.xspeed = 0;
			}
	    }
		
		_total_xspeed = global.xspeed + global.xforce;
		_total_yspeed = global.yspeed + global.yforce;
	}


	//Invincibility
	if invincibilityTimer != 0
	{
	    invincibilityTimer -= 1;
	    if invincibilityTimer <= 0
	    {
	        invincibilityTimer = 0;
			//playerCollision();
	        canHit = true;
	        visible = true;
	    }
	    else
	    {
	        if (invincibilityTimer mod 4 == 3 or invincibilityTimer mod 4 == 2)
			{
	            visible = false;
			}
	        else
			{
	            visible = true;
			}
	    }
	}
	
	
	//While being stunned
	if isStun
	{
		stunTimer -= 1;
		if stunTimer <= 0
		{
			stunTimer = 0;
			isStun = false;
			
			if stunKnockbackSpeed != 0
			{
				if !place_meeting(x, y+1, objIce)
					global.xspeed = 0;
					
				_total_xspeed = global.xspeed + global.xforce;
					
				stunKnockbackSpeed = 0;
			}
			
	        if !locked {
				canMove = true;
				canWalk = true;
		        canSpriteChange = true;
				
				if isFly && !flying {
					flying = true;
				}
				if isRollback && !rollbackMovement {
					rollbackMovement = true;
				}
				
				mask_index = mskMegaman;
				playerCrush();
				if global._health <= 0
				{
					sprite_index = spriteStand;
					image_speed = speedStand;
				}
	        }
			else {
				playerLockMovement(false);
			}
		}
		else
		{
			if stunKnockbackSpeed != 0
			{
				if image_xscale < 0 { _xc = clamp(abs(_total_xspeed), 0.5, 1); }
				else { _xc = clamp(abs(_total_xspeed), 0.500005, 1); }
			
		        if (image_xscale >= 0 and !(bbox_left+_total_xspeed-_xc < sectionLeft or bbox_left+_total_xspeed-_xc < 0))
				|| (image_xscale < 0 and !(bbox_right+_total_xspeed+_xc > sectionRight or bbox_right+_total_xspeed+_xc > room_width))
				{
					if !place_meeting(x-(_xc * image_xscale), y, objSolid) && !place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid)
			            global.xspeed = stunKnockbackSpeed;
			        else if place_meeting(x-(_xc * image_xscale), y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
			        {
			            if instance_place(x-(_xc * image_xscale), y, prtMovingPlatformSolid).dead == true
			                global.xspeed = stunKnockbackSpeed;
			        }
				}
			}
			else
			{
				if !place_meeting(x, y+1, objIce)
					global.xspeed = 0;
			}
		}
		
		_total_xspeed = global.xspeed + global.xforce;
		_total_yspeed = global.yspeed + global.yforce;
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


	//Gravity
	if ground == false && canGravity == true
	{
	    global.yspeed += currentGrav;
	    if global.yspeed > maxVspeed
	        global.yspeed = maxVspeed;
	}
	else
	{
	    canMinJump = true;
	}
	
	_total_yspeed = global.yspeed + global.yforce;


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
                
            if !meetingPlatform && !crushed
				escapeWall(true, true, true, true);
				
			instance_activate_object(myPlt.id);
		}
		else
		{
			if !crushed escapeWall(true, true, true, true);
		}
	}
	
	if _total_yspeed == 0 && !place_meeting(x, y+2, objSolid) && (!place_meeting(x, y+2, prtMovingPlatformSolid)
	|| instance_place(x, y+2, prtMovingPlatformSolid).dead) && movedPlatformID == -20 && !pushedBySpawnedSolid
	{
		if !crushed
			escapeWall(false, false, false, true);
	}

	if place_free(x, y)
	{
		prevPltSpeedX = pltSpeedX;
		prevPltSpeedY = pltSpeedY;
	}
	
	
	//global.xspeed += global.xforce;
	//global.yspeed += global.yforce;
	//_x_rb = global.xspeed;
	//_y_rb = global.yspeed;
	print(global.xspeed);



}
