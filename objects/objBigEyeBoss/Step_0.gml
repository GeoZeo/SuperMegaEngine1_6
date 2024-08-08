event_inherited();

if !global.frozen && !dead && isFight
{
    checkGround();
    gravityCheckGround();
    generalCollision();
    escapeWall(true, true, true, true);
    
    if ground {
		
		xspeed = 0;
        yspeed = 0;
		
        moveTimer += 1;
        if moveTimer == 1 {
            if repeatAmount < 2 {
                randomize();
                highJump = choose(true, false); //False means a low jump, true means a high jump
            }
            else {
                highJump = !repeatIsHigh;
            }
            
            if !prevGround {
                if repeatIsHigh {
                    instance_create(x, bbox_bottom, objShake);
					playSFX(sfxGroundPound);
                }
				else {
					playSFX(sfxBigEye);
				}
            }
            
            image_index = 4;
                
            //To not make the Big Eye spam one jump height by pure randomness
            //Because if he spams low jumps, it's nearly impossible to pass him
            if highJump == true && repeatIsHigh == true
                repeatAmount += 1;
            else if highJump == false && repeatIsHigh == false
                repeatAmount += 1;
            else {
                repeatAmount = 1;
                repeatIsHigh = highJump;
            }
                
            if instance_exists(prtPlayer) {
                if x > prtPlayer.x
                    image_xscale = -2;
                else
                    image_xscale = 2;
            }
        }
        else if moveTimer == 4 {
            image_index = 0;
        }
        else if moveTimer == 6 {
            if highJump == true
                image_index = 1;
            else
                image_index = 0;
        }
        else if moveTimer == 40 {
            if highJump == true {
                yspeed = -7;
				
                if place_free(x+(sign(image_xscale)*8), y)
	                xspeed = image_xscale * 0.5;
                
				image_index = 3;
            }
            else {
                yspeed = -4;
				
                if place_free(x+(sign(image_xscale)*8), y)
	                xspeed = image_xscale * 0.5;
                
				image_index = 2;
            }
            
            moveTimer = 0;
        }
    }
	else if place_free(x+(sign(image_xscale)*8), y)
	{
		if moveTimer <= 0 || floor(moveTimer) == 40
			xspeed = image_xscale * 0.5;
	}
	else
	{
		xspeed = 0;
	}
    
    //x += xspeed;
    //y += yspeed;
    
    prevGround = ground;

}
else {
    if dead {
        moveTimer = 0;
        image_index = 2;
        repeatAmount = 0;
        repeatIsHigh = true;
    }
}



