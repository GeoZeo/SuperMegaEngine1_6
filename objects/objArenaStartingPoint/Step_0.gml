if !global.frozen
{	
	if isMM
	{
		checkGround();
	    gravityCheckGroundExt(currentGrav);
	    generalCollision();
		
	    if (x < xstart or x > xstart) || ((oldX < xstart and x >= xstart) or (oldX > xstart and x <= xstart))
	    {
			if stepTimer < stepTime && sprite_index != prtPlayer.spriteWalk
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
            
	        //if (place_meeting(x+xspeed*8, y, objSolid) || place_meeting(x+xspeed*8, y, prtMovingPlatformSolid))
	        //&& ground == true
	        //{
	        //    if ((position_meeting(bbox_right+xspeed*8, bbox_top, objSolid) || position_meeting(bbox_right+xspeed*8, bbox_top, prtMovingPlatformSolid))
	        //    && image_xscale == 1)
	        //    || ((position_meeting(bbox_left+xspeed*8, bbox_top, objSolid) || position_meeting(bbox_left+xspeed*8, bbox_top, prtMovingPlatformSolid))
	        //    && image_xscale == -1) //If we are blocked by a wall of at least 2 blocks high, perform a high jump
	        //        yspeed = -5.25;
	        //    else //Else, perform a short, 1-block-high jump
	        //        yspeed = -3.5;
	        //}
            
	        if ground == true
				if stepTimer < stepTime && sprite_index != prtPlayer.spriteWalk
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
        
		oldX = x;
		
	    x += xspeed;
	    y += yspeed;
	}
}

