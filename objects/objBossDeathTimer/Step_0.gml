if !global.frozen {
	if isMM {
	    with prtPlayerProjectile instance_destroy();
	}
	if isMM == true && teleporting == false && instance_exists(prtPlayer)
	{
	    if absorbing == false
	    {
	        var destX;
			if control > -1 && (control.centreExit or (global.weaponID > -1 and !global.weaponID.unlocked))
				destX = round(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 )/2));
			else
				destX = x;
        
	        checkGround();
	        gravityCheckGroundExt(currentGrav);
	        generalCollision();
        
	        if (x < destX-2 || x > destX+2) && !noBoss
	        {
				if stepTimer < stepTime
				{
					if x < destX
		            {
						if stepTimer <= 0
							xspeed = cfgStepSpeed * cfgStepFrames;
						else
							xspeed = 0;
		                image_xscale = 1;
		            }
		            else if x > destX
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
					if x < destX
		            {
		                xspeed = cfgWalkSpeed;
		                image_xscale = 1;
		            }
		            else if x > destX
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
					if stepTimer < stepTime
					{
						sprite_index = prtPlayer.spriteStep;
						image_speed = prtPlayer.speedStep;
					}
					else
					{
						sprite_index = prtPlayer.spriteWalk;
						image_speed = prtPlayer.speedWalk;
					}
	            else
				{
					sprite_index = prtPlayer.spriteJump;
					image_speed = prtPlayer.speedJump;
				}
                
                
	            if prevGround == false && ground == true
	                playSFX(sfxLand);
                
	            prevGround = ground;
	        }
	        else
	        {
				xspeed = 0;
				
				if bbox_top > prtPlayer.sectionBottom || bbox_top > room_height {
			        global._health = 0;
					prtPlayer.deathByPit = true;
			    }
				
	            if canInitJump == true && ground == true
	            {
	                if global.weaponID > -1 && !global.weaponID.unlocked //Only absorb the power if it's not already been unlocked
	                {
	                    canInitJump = false;
					
	                    x = destX;
	                    sprite_index = prtPlayer.spriteJump;
						image_speed = prtPlayer.speedJump;
						currentGrav = cfgGravityWater;
	                    yspeed = -4.85;
	                }
	                else
	                {
	                    //Teleport out
	                    yspeed = 0;
	                    teleporting = true;
	                    alarm[2] = 60;
	                    playSFX(sfxTeleportOut);
	                    sprite_index = prtPlayer.spriteTeleport;
						image_speed = prtPlayer.speedTeleport;
	                }
	            }
            
	            if yspeed > 0 && y >= __view_get( e__VW.YView, 0 )+112 && canInitJump == false && !global.weaponID.unlocked
	            {
	                y = __view_get( e__VW.YView, 0 )+112;
	                absorbing = true;
	            }
				
				if prevGround == false && ground == true
	                playSFX(sfxLand);
                
	            prevGround = ground;
	        }
        
	        x += xspeed;
	        y += yspeed;
	    }
	    else
	    {
	        //Absorbing the boss's power
	        if !instance_exists(objAbsorbEffect)
	        {
	            if absorbAmount < 3
	            {
	                absorbAmount += 1;
                
	                playSFX(sfxAbsorb);
	                var ID, fastSpd, slowSpd, radius, angle;
	                fastSpd = 7;
	                slowSpd = 3;radius = __view_get( e__VW.WView, 0 )/2;
	                angle = 0;
                
	                repeat 8
	                {
	                    angle += 0.25*pi;
                    
	                    ID = instance_create(sprite_get_xcenter() + radius*cos(angle), sprite_get_ycenter() + radius*sin(angle), objAbsorbEffect);
	                        ID.spd = fastSpd;
	                    ID = instance_create(sprite_get_xcenter() + radius*cos(angle), sprite_get_ycenter() + radius*sin(angle), objAbsorbEffect);
	                        ID.spd = slowSpd; 
	                }
	            }
	            else
	            {
	                checkGround();
	                gravityCheckGroundExt(currentGrav);
	                generalCollision();
                
	                if ground == true
	                {
						currentGrav = cfgGravity;
	                    sprite_index = prtPlayer.spriteStand;
	                    image_speed = prtPlayer.speedStand;
						if startTeleportTimer <= 0 {
							image_index = 0;
					
							if !teleporting
								playSFX(sfxLand);
						}
                    
	                    startTeleportTimer += 1;
	                    if startTeleportTimer >= 55
	                    {
	                        startTeleportTimer = 0;
	                        yspeed = 0;
	                        teleporting = true;
	                        alarm[2] = 60;
	                        playSFX(sfxTeleportOut);
	                        sprite_index = prtPlayer.spriteTeleport;
							image_speed = prtPlayer.speedTeleport;
	                    }
	                }
                
	                y += yspeed;
	            }
	        }
	    }
	}
}
else {
	if alarm[0] > 0 {
        alarm[0]++;
    }
	if alarm[1] > 0 {
        alarm[1]++;
    }
	if alarm[2] > 0 {
        alarm[2]++;
    }
}

