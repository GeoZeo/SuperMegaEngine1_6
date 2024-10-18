event_inherited();

if !global.frozen and !dead and !dying {
    if instance_exists(prtPlayer) {
		player_sprite_yoffset = prtPlayer.sprite_yoffset;
		player_sprite_height = prtPlayer.sprite_height;
    }
	
	if x < player_x
        image_xscale = 1;
    else
        image_xscale = -1;
        
    // If this Gabyoall and Mega Man are on the same height, have the Gabyoall start dashing.
    if abs(y - (player_y - player_sprite_yoffset + player_sprite_height)) < 4
        dashing = true;
    else
        dashing = false;
    
    if dashing
        xspeed = startDir * 2;
    else
        xspeed = startDir * 0.5;
        
    generalCollision();
    
    if floor(frozeTimer) == 0 {
        frozeTimer = 0;    
        image_speed = 0.2 * update_rate;
    
        if (xspeed == 0 || 
            !collision_rectangle(x+(startDir*8), y, x+(startDir*9), y+1, objSolid, false, false)) {
            startDir = -startDir;   //Change the direction
        }
        
    }
    else {
        image_speed = 0;
        xspeed = 0;
        frozeTimer -= update_rate;
    }
	
	x += xspeed * update_rate;
}
else {
    xspeed = 0;
    yspeed = 0;

    if dead || dying {
		
		if x < player_x
	        startDir = 1;
	    else
	        startDir = -1;
		
        //startDir = beginStartDir;
        dashing = false;
        frozeTimer = 0;
        image_index = 0;
    }
	
	if global.frozen {
		
		image_speed = 0;
	}
}

