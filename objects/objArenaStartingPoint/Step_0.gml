if !global.frozen
{	
	if isMM && instance_exists(prtPlayer)
	{
		checkGround();
	    gravityCheckGroundExt(currentGrav);
	    generalCollision();
		
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
				xspeed = 0;
	            yspeed = 0;
				prtPlayer.visible = true;
                instance_destroy();
	        }
	    }
		
		global.xspeed = xspeed;
		global.yspeed = yspeed;
	    x += xspeed;
	    y += yspeed;
		
		if bbox_top > prtPlayer.sectionBottom || bbox_top > room_height {
			global._health = 0;
			prtPlayer.deathByPit = true;
		}
	}
}

