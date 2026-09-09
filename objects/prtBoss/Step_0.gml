canDamage = true;

if !global.frozen {
	if (instance_exists(prtPlayer)) {
		if !checkPlayerSpriteCenter
		{
			player_x = prtPlayer.x;
			player_y = prtPlayer.y;
		}
		else
		{
			player_x = sprite_get_xcenter_object(prtPlayer);
			player_y = sprite_get_ycenter_object(prtPlayer);
		}
		section_bottom = prtPlayer.sectionBottom;
	}
	
	if pose > -1 && isIntro {
        
		if y < ystart && !landed {
            update_rate = 1;
			gravityNoGround();
			if y+yspeed >= ystart {
				generalCollision();
				landed = true;
			}
        }
        else {
            y = ystart;
            if pose > -1 {
                sprite_index = pose;
            }
            yspeed = 0;
            
            if image_speed == 0
                image_index = 0;
            image_speed = poseImgSpeed;
            
            if image_index >= image_number-1 {
                image_index = image_number-1;
                image_speed = 0;
                isIntro = false;
            }
        }
    }
    
    
    //Starting the actual fight
    if startFight {
        startFight = false;
        isFight = true;
    }
 
    x += xspeed * update_rate;
    y += yspeed * update_rate; 
	
	if bbox_top >= section_bottom
	|| bbox_top >= room_height
	{
		event_user(13);
	}
}
else {
    if alarm[9] != -1
        alarm[9] += 1;
    if alarm[10] != -1
        alarm[10] += 1;
}

