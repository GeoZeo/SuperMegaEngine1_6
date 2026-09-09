event_inherited();

if global.frozen == false
{
    if isFight == true
    {   
		if instance_exists(prtPlayer)
		{
			player_sprite_xcenter = sprite_get_xcenter_object(prtPlayer);
			player_sprite_ycenter = sprite_get_ycenter_object(prtPlayer);
			player_bbox_bottom = prtPlayer.bbox_bottom;
		}
		
		checkGround();
		gravityCheckGround();
		generalCollision();
		
        switch phase
        {
            case 0: //Idle (standing still)
				xspeed = 0;
				if yspeed < 0 yspeed = 0;
				
                sprite_index = sprPharaohStand;
                image_speed = 0;
                
                attackTimer -= update_rate;
                if attackTimer <= 0
                {
                    if attackTimer == -1 //It's -1 when first attacking; the first attack is always a jump 'n shoot
                        phase = 2;
                    else
                    {
                        randomize();
                        phase = choose(1, 2, 3, 3); //There seems to be a higher chance of him shooting
                    }
					
					if phase == 2
					{
						randomize();
						jumpAmount = choose(0, 0, 1); //Originally in MM4, Pharaoh Man would sometimes only jump once instead of twice during this phase
					}
                }
            break;
            
            
            
            case 1: //Jumping
                if attackTimer <= 0
                {
                    attackTimer = 35;
                    
                    startXScale = image_xscale;
                        
                    //Calculate the time needed to jump to MM's position, and with that, calculate the horizontal speed
                    var dx, initYspeed;
                    dx = player_sprite_xcenter - sprite_get_xcenter();
                    initYspeed = -6.5;
                        
                    var time, yy, yyspeed; //time: How much time (in frames) it would take to land on Mega Man's location
                    yy = bbox_bottom;
                    yyspeed = initYspeed;
                    time = 0;
                        
                    while yy < player_bbox_bottom || yyspeed < 0
                    {
                        yyspeed += 0.25;
                        yy += yyspeed;
                        time += 1;
                    }
                        
                    startXspeed = dx / time;
                    yspeed = initYspeed;
                    ground = false;
                }
                
                if !place_meeting(x+startXspeed, y, objSolid) && !place_meeting(x+startXspeed, y, prtMovingPlatformSolid)
                    xspeed = startXspeed;
                else if place_meeting(x+startXspeed, y, prtMovingPlatformSolid)
				{
					if instance_place(x+startXspeed, y, prtMovingPlatformSolid).dead
						xspeed = startXspeed;
				}
				else
                {           
                    xspeed = 0;
                }
                
                
                //Face the player
                if startXScale == -1
                {
                    if x > player_x
                        sprite_index = sprPharaohJump;
                    else
                        sprite_index = sprPharaohJumpBack;
                }
                else
                {
                    if x > player_x
                        sprite_index = sprPharaohJumpBack;
                    else
                        sprite_index = sprPharaohJump;
                }
                
                
                //When grounded, end the jump
                if ground == true
                {
                    phase = 0;
                    sprite_index = sprPharaohStand;
                    xspeed = 0;
                    yspeed = 0;
                }
            break;
            
            case 2: //Jumping 'n shooting
                if attackTimer <= 0
                {
                    attackTimer = 35;
                    jumpTimer = 0;
                    
                    startXScale = image_xscale;
                    yspeed = -5;
                    sprite_index = sprPharaohJumpShoot;
                    image_index = 0;
                    image_speed = 1/16 * update_rate;
					if player_x > x
						dir = 1;
					else
						dir = -1;
						
                    ground = false;
                }
                
                if sprite_index == sprPharaohJumpShoot || sprite_index == sprPharaohJumpShootBack
                {
                    if floor(image_index) == 3
                    {
                        if canInitShoot == true
                        {
                            canInitShoot = false;
                            
                            var shootID, box;
                            if image_xscale == 1
                                box = bbox_right;
                            else
                                box = bbox_left;
                            
                            shootID = instance_create(box, y-8, objPharaohManShot);
								shootID.player_x = player_sprite_xcenter;
								shootID.player_y = player_sprite_ycenter;
								shootID.dir = dir;
								with shootID event_user(1);
                        }
                        
                        image_speed = 0.1 * update_rate;
						canInitJumpShoot = false;
                    }
					else
					{
						if floor(image_index) >= 1
						{
							image_speed = 0.118 * update_rate;
							canInitJumpShoot = false;
						}
						else if floor(image_index) == 0
						{
							if !canInitJumpShoot
								image_speed = 0.118 * update_rate;
							else
								image_speed = 1/16 * update_rate;
							
							canInitShoot = true;
						}
					}
                    //else if floor(image_index) == image_number-1
                    //{
                    //    image_index = image_number-1;
                    //    image_speed = 0;
                    //}
                    //else
                    //{
                    //    image_speed = 6/60 * update_rate;
                    //}
                }
                
                if !place_meeting(x+startXScale * 2, y, objSolid) && !place_meeting(x+startXScale * 2, y, prtMovingPlatformSolid)
                    xspeed = startXScale * 2;
                else if place_meeting(x+startXScale * 2, y, prtMovingPlatformSolid)
				{
					if instance_place(x+startXScale * 2, y, prtMovingPlatformSolid).dead
						xspeed = startXScale * 2;
				}
				else
                {
                    xspeed = 0;
                }
                    
                    
                //Either jump again or end the phase
                if ground == true
                {
                    if jumpAmount == 0
                    {
                        sprite_index = sprPharaohJumpShoot;
                        jumpTimer = 0;
                        jumpAmount = 1;
						if player_x > x
							dir = 1;
						else
							dir = -1;
                        //canInitShoot = true;
                        yspeed = -5;
                    }
                    else
                    {
                        jumpAmount = 0;
                        canInitShoot = true;
						canInitJumpShoot = true;
                        phase = 0;
                        sprite_index = sprPharaohStand;
                        xspeed = 0;
                        yspeed = 0;
                    }
                }
                    
                    
                //Face the player
				if floor(image_index) == 0
				{
	                if startXScale == -1
	                {
	                    if sprite_index == sprPharaohJump || sprite_index == sprPharaohJumpBack
	                    {
	                        if x > player_x
	                            sprite_index = sprPharaohJump;
	                        else
	                            sprite_index = sprPharaohJumpBack;
	                    }
	                    else if sprite_index == sprPharaohJumpShoot || sprite_index == sprPharaohJumpShootBack
	                    {
	                        if x > player_x
	                            sprite_index = sprPharaohJumpShoot;
	                        else
	                            sprite_index = sprPharaohJumpShootBack;
	                    }
	                }
	                else
	                {
	                    if sprite_index == sprPharaohJump || sprite_index == sprPharaohJumpBack
	                    {
	                        if x > player_x
	                            sprite_index = sprPharaohJumpBack;
	                        else
	                            sprite_index = sprPharaohJump;
	                    }
	                    else if sprite_index == sprPharaohJumpShoot || sprite_index == sprPharaohJumpShootBack
	                    {
	                        if x > player_x
	                            sprite_index = sprPharaohJumpShootBack;
	                        else
	                            sprite_index = sprPharaohJumpShoot;
	                    }
	                }
				}
            break;
            
            
            
            case 3: //Shooting a big shot
                if attackTimer <= 0
                {
                    attackTimer = 35;
                    jumpTimer = 0;
                    
                    sprite_index = sprPharaohCharge;
                    image_speed = 0.25 * update_rate;
                    image_index = 0;
                }
                
                if sprite_index == sprPharaohCharge //This extra code is to make sure the animation resumes after pausing and unpausing
                    image_speed = 0.25 * update_rate;
                else if sprite_index == sprPharaohCharge2
                    image_speed = 0.125 * update_rate;
                else if sprite_index = sprPharaohCharge3
                    image_speed = 0.25 * update_rate;
                
                jumpTimer += update_rate; //It's not really a timer for jumping, but rather for releasing the shot; however, reusing this variable saves initializing a new one
                if jumpTimer >= 48
                {                    
                    if floor(jumpTimer) == 49
                    {
                        jumpTimer = 50;
                        sprite_index = sprPharaohCharge2;
                        image_index = 0;
                        image_speed = 0.125 * update_rate;
                    }
                    else if floor(jumpTimer) == 66
                    {
                        jumpTimer = 67;
                        sprite_index = sprPharaohCharge3;
                        image_index = 0;
                        image_speed = 0.25 * update_rate;
                    }
					else if floor(jumpTimer) == 75
					{
						jumpTimer = 76;
						sprite_index = sprPharaohCharge3;
						image_index = 0;
						image_speed = 0.25 * update_rate;
					}
					else if floor(jumpTimer) == 77
					{
						jumpTimer = 78;
						sprite_index = sprPharaohCharge3;
                        image_index = 1;
                        image_speed = 0.25 * update_rate;
						
						var shootID, box;
                        if image_xscale == 1
                            box = bbox_right+10;
                        else
                            box = bbox_left-10;
                            
                        shootID = instance_create(box, y+2, objPharaohManShotBig);
                            shootID.image_xscale = image_xscale;
					}
                    else if floor(jumpTimer) == 81
                    {
                        jumpTimer = 82;
                        sprite_index = sprPharaohShoot;
                    }
                    else if floor(jumpTimer) == 87
                    {
                        jumpTimer = 88;
                        phase = 0;
                        sprite_index = sprPharaohStand;
                        xspeed = 0;
                        yspeed = 0;
                    }
                }
            break;
        }
        
        
        //Face the player
		if floor(image_index) == 0 || !(sprite_index == sprPharaohJumpShoot || sprite_index == sprPharaohJumpShootBack)
		{
	        if x > player_x
			{
	            image_xscale = -1;
				dir = -1;
			}
			else
			{
	            image_xscale = 1;
				dir = 1;
			}
		}
		
		escapeWall(true, true, true, true);
    }
}
else {
	if phase == 3 image_index -= image_speed;
    image_speed = 0;
}


