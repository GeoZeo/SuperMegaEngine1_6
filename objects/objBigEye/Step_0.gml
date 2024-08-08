event_inherited();

if !global.frozen and !dead and !dying {
    checkGround();
	gravityCheckGround();
	generalCollision();
	
    if ground {
		
		xspeed = 0;
        yspeed = 0;
		
        moveTimer += update_rate;
        if floor(moveTimer) == 1 {
            moveTimer = 2;
            if repeatAmount < 2 {
                randomize();
                highJump = choose(true, false); //False means a low jump, true means a high jump
            }
            else {
                highJump = !repeatIsHigh;
            }
            
            if prevGround == false
                playSFX(sfxBigEye);
            
            image_index = 4;
                
            //To not make the Big Eye spam one jump height by pure randomness
            //Because if he spams low jumps, it's nearly impossible to pass him
            if highJump  and repeatIsHigh
                repeatAmount++;
            else if !highJump and !repeatIsHigh
                repeatAmount++;
            else {
                repeatAmount = 1;
                repeatIsHigh = highJump;
            }
                
            if instance_exists(prtPlayer) {
                if x > prtPlayer.x
                    image_xscale = -1;
                else
                    image_xscale = 1;
            }
        }
        else if floor(moveTimer) == 4 {
            moveTimer = 5;
            image_index = 0;
        }
        else if floor(moveTimer) == 6 {
            moveTimer = 7;
            if highJump
                image_index = 1;
            else
                image_index = 0;
        }
        else if floor(moveTimer) == 40 {
            if highJump {
                yspeed = -6;
				
	            if place_free(x+(sign(image_xscale)*5), y)
	                xspeed = image_xscale * 1;
                
				image_index = 3;
            }
            else {
                yspeed = -3;
                
	            if place_free(x+(sign(image_xscale)*4), y)
	                xspeed = image_xscale * 1;
                
                image_index = 2;
            }
            
            moveTimer = 0;
        }
    }
	else if place_free(x+(sign(image_xscale)*4), y)
	{
		if moveTimer <= 0 || floor(moveTimer) == 40
			xspeed = image_xscale * 1;
	}
	else
	{
		xspeed = 0;
	}
    
	x += xspeed * update_rate;
    y += yspeed * update_rate;
	
    prevGround = ground;
    
    escapeWall(true, true, true, true);
}
else {
    if dead || dying {
        moveTimer = 0;
        image_index = 2;
        repeatAmount = 0;
        repeatIsHigh = true;
    }
}

