if teleporting == false && teleportingUp == false
{
    drawSelf();
}
else if teleporting == true
{
    if round(__view_get( e__VW.YView, 0 )-16+teleportY) >= y && shouldLand == true
    {
        if teleportTimer == 0
            playSFX(sfxTeleportIn);
        
        //Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   //Rush disappears for one frame
            drawSelf();
        
        if teleportTimer == 2
            image_index = 1;
        else if teleportTimer == 4
            image_index = 0;
        else if teleportTimer == 6
            image_index = 2;
        else if (teleportTimer = 9 && !collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false))
        || (teleportTimer == 15 && collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false))
        {
            teleporting = false;
            teleportTimer = 0;
            teleportY = 0;
			currentTeleportSpeed = 0;
            if !collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false)
                canCoil = true;
            sprite_index = sprRush;
			mask_index = sprRushMask;
            exit;
        }
        
        if global.frozen == false
            teleportTimer += 1;
    }
    else if round(__view_get( e__VW.YView, 0 )-16+teleportY) >= __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )
    {
		//Teleporting downwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(__view_get( e__VW.YView, 0 )-16+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
		
        instance_destroy();
    }
    else
    {
        //Teleporting downwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(__view_get( e__VW.YView, 0 )-16+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        
        if global.frozen == false {
			if abs(cfgRushTeleportAcc) > 0 {
				currentTeleportSpeed += abs(cfgRushTeleportAcc);
				if currentTeleportSpeed >= abs(cfgRushTeleportSpeed) {
					currentTeleportSpeed = abs(cfgRushTeleportSpeed);
				}
			}
			else {
				currentTeleportSpeed = abs(cfgRushTeleportSpeed);
			}
		
			teleportY += currentTeleportSpeed;
		}
    }
}
else if teleportingUp == true
{
    if teleportY == 0
    {
        //Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   //Rush disappears for one frame
            drawSelf();
        
        if teleportTimer == 2
            image_index = 2;
        else if teleportTimer == 4
            image_index = 0;
        else if teleportTimer == 6
            image_index = 1;
        else if teleportTimer = 9
        {
			if abs(cfgRushTeleportAcc) > 0 {
				currentTeleportSpeed += abs(cfgRushTeleportAcc);
				if currentTeleportSpeed >= abs(cfgRushTeleportSpeed) {
					currentTeleportSpeed = abs(cfgRushTeleportSpeed);
				}
			}
			else {
				currentTeleportSpeed = abs(cfgRushTeleportSpeed);
			}
			
            teleportY -= currentTeleportSpeed;
            image_speed = 0;
            image_index = 0;
            exit;
        }
        
        if global.frozen == false
            teleportTimer += 1;
    }
    else
    {
        //Teleporting upwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(y+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        
        if global.frozen == false {
			if abs(cfgRushTeleportAcc) > 0 {
				currentTeleportSpeed += abs(cfgRushTeleportAcc);
				if currentTeleportSpeed >= abs(cfgRushTeleportSpeed) {
					currentTeleportSpeed = abs(cfgRushTeleportSpeed);
				}
			}
			else {
				currentTeleportSpeed = abs(cfgRushTeleportSpeed);
			}
			
            teleportY -= currentTeleportSpeed;
		}
        
        if round(y+16+teleportY) <= __view_get( e__VW.YView, 0 ) || round(y+16+teleportY) <= 0
            instance_destroy();
    }
}

