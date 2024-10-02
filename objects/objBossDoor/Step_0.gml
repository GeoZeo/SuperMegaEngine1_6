if halfDoor {
    sprite_index = sprBossHalfDoor;
}
if canOpen {
	if instance_exists(prtPlayer) {
		player_x = prtPlayer.x;
	}
    if mySolid > -1 {
        if dir == -1 {
            mySolid.x = x+16;
        }
        else {
            mySolid.x = x;
        }
		if dir == -1 && (halfDoor and player_x > x+16)
			mySolid.x = x;
		else if dir == 1 && (halfDoor and player_x < x)
			mySolid.x = x+16;
    }
    if instance_exists(prtPlayer) {
        //Colliding with the player. We're checking x+7 because in the NES games, the player needs to be slightly inside the door
        //for it to activate.
        if ((collision_rectangle(x+7+(1 * prtPlayer.image_xscale < 0)+(((prtPlayer.isSlide or prtPlayer.isStun) && prtPlayer.image_xscale < 0) * 3), y, x+8+(1 * prtPlayer.image_xscale < 0)+(((prtPlayer.isSlide or prtPlayer.isStun) && prtPlayer.image_xscale < 0) * 3), y+sprite_height, prtPlayer, false, false) && dir == -1)
        || (collision_rectangle(x+sprite_width-8-(1 * prtPlayer.image_xscale > 0)-(((prtPlayer.isSlide or prtPlayer.isStun) && prtPlayer.image_xscale > 0) * 3), y, x+sprite_width-7-(1 * prtPlayer.image_xscale > 0)-(((prtPlayer.isSlide or prtPlayer.isStun) && prtPlayer.image_xscale > 0) * 3), y+sprite_height, prtPlayer, false, false) && dir == 1))
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
            if dir == -1 //Switch to the right
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
                    newSectionXOffset = 64;
                    newSectionYOffset = 0;
                    
                    alarm[2] = 1;
                }
            }
            else { //Switch to the left
                with prtPlayer {
                    instance_activate_object(objSectionBorderLeft);
                    instance_activate_object(objSectionBorderRight);
                    instance_activate_object(objSectionBorderTop);
                    instance_activate_object(objSectionBorderBottom);
                    instance_activate_object(objSectionArrowLeft);
                    instance_activate_object(objSectionArrowRight);
                    instance_activate_object(objSectionArrowUp);
                    instance_activate_object(objSectionArrowDown);
                    newSectionXOffset = -64;
                    newSectionYOffset = 0;
                    
                    alarm[2] = 1;
                }
            }
        }
    }
}

if opening {
    if floor(image_index) == 4 {
        image_index = 4;
        image_speed = 0;
    }
}

if closing {
    image_speed = openImgSpeed;
    if floor(image_index) == 8 {
        image_index = 8;
        
        if !halfDoor {
            if dir == -1 {
                mySolid = instance_create(x+16, y, objSolid);
                mySolid.image_yscale = 4;
            }
            else {
                mySolid = instance_create(x, y, objSolid);
                mySolid.image_yscale = 4;
            }
        }
        else {
                mySolid = instance_create(x, y, objSolid);
                mySolid.image_yscale = 4;
        }
		
		//prtPlayer.x = ((x+16)+(32*-dir))-(cfgPushStartingPosBack*-dir); //Comment out if you don't mind MM's exact position upon the door closing being impacted by what sub-pixel he happens to be on upon it opening
            
        with objSectionSwitcher {
			x = prtPlayer.x;
            global.frozen = false;
            prtPlayer.visible = true;
            instance_destroy();
            with prtPlayer playerDeactivateObjects();
        }
        
        closing = false;
        image_speed = 0;
    }
}

