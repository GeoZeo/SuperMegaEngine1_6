if isMM {
    with prtPlayerProjectile instance_destroy();
}
if isMM == true && teleporting == false
{
    if absorbing == false
    {
        var destX;
        destX = round(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 )/2));
        
        checkGround();
        gravityCheckGroundExt(currentGrav);
        generalCollision();
        
        if (x < destX-2 || x > destX+2) && !noBoss
        {
			if stepTimer < stepTime
			{
				if x < destX
	            {
	                xspeed = cfgStepSpeed;
	                image_xscale = 1;
	            }
	            else if x > destX
	            {
	                xspeed = -cfgStepSpeed;
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
                    xspeed = 0;
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

