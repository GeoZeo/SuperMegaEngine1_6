if halfDoor {
    sprite_index = sprBossHalfDoorH;
}
if canOpen == true {
	if instance_exists(prtPlayer) {
		player_y = prtPlayer.y;
	}
	if mySolid > -1 {
        if dir == -1 {
            mySolid.y = y+16;
        }
        else {
            mySolid.y = y;
        }
		if dir == -1 && (halfDoor and player_y > x+16)
			mySolid.y = y;
		else if dir == 1 && (halfDoor and player_y < x)
			mySolid.y = y+16;
    }
    if instance_exists(prtPlayer) {
        //Colliding with the player. We're checking y+7 because in the NES games, the player needs to be slightly inside the door
        //for it to activate.
        if ((collision_rectangle(x, y+7, x+sprite_width, y+8, prtPlayer, false, false) && dir == -1)
        || (collision_rectangle(x, y+sprite_height-8, x+sprite_width, y+sprite_height-7, prtPlayer, false, false) && dir == 1))
		&& (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) {
            canOpen = false;
            opening = true;
            image_speed = openImgSpeed;
            playSFX(sfxDoor);
			instance_activate_object(mySolid);
            with mySolid instance_destroy();
			with objPauseMenu instance_destroy();
			stopSFX(sfxPause);
            
            //Switch sections
            if dir == -1 //Switch to the bottom
            {
                with prtPlayer
                {
                    instance_activate_object(objSectionBorderLeft);
                    instance_activate_object(objSectionBorderRight);
                    instance_activate_object(objSectionBorderTop);
                    instance_activate_object(objSectionBorderBottom);
                    instance_activate_object(objSectionArrowLeft);
                    instance_activate_object(objSectionArrowRight);
                    instance_activate_object(objSectionArrowUp);
                    instance_activate_object(objSectionArrowDown);
                    newSectionXOffset = 0;
                    newSectionYOffset = 64;
                    
                    alarm[2] = 1;
                }
            }
            else { //Switch to the top
                with prtPlayer {
                    instance_activate_object(objSectionBorderLeft);
                    instance_activate_object(objSectionBorderRight);
                    instance_activate_object(objSectionBorderTop);
                    instance_activate_object(objSectionBorderBottom);
                    instance_activate_object(objSectionArrowLeft);
                    instance_activate_object(objSectionArrowRight);
                    instance_activate_object(objSectionArrowUp);
                    instance_activate_object(objSectionArrowDown);
                    newSectionXOffset = 0;
                    newSectionYOffset = -64;
                    
                    alarm[2] = 1;
                }
            }
        }
    }
}

if opening == true {
    if floor(image_index) == 4 {
        image_index = 4;
        image_speed = 0;
    }
}

if closing == true {
    image_speed = openImgSpeed;
    if floor(image_index) == 8 {
        image_index = 8;
        
        if !halfDoor {
            if dir == -1 {
                mySolid = instance_create(x, y+16, objSolid);
                mySolid.image_xscale = 4;
            }
            else {
                mySolid = instance_create(x, y, objSolid);
                mySolid.image_xscale = 4;
            }
        }
        else {
                mySolid = instance_create(x, y, objSolid);
                mySolid.image_xscale = 4;
        }
            
        with objSectionSwitcher {
            global.frozen = false;
            prtPlayer.visible = true;
            instance_destroy();
            with prtPlayer playerDeactivateObjects();
        }
        
        closing = false;
        image_speed = 0;
    }
}

