if teleporting == false && teleportingUp == false
{
    drawSelf();
}
else if teleporting == true
{
    if round(global.viewY-16+teleportY) >= y && shouldLand == true
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
            sprite_index = sprRushJet;
            dead = false;
            exit;
        }
        
        if global.frozen == false
            teleportTimer += 1;
    }
    else if round(global.viewY-16+teleportY) >= global.viewY+global.viewHeight
    {
		//Teleporting downwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(global.viewY-16+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
		
        instance_destroy();
    }
    else
    {
        //Teleporting downwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(global.viewY-16+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        if !prtPlayer.ground && !place_meeting(x, sprite_get_ycenter_object(prtPlayer) + 16, objSolid)
		&& (!place_meeting(x, sprite_get_ycenter_object(prtPlayer) + 16, prtMovingPlatformSolid) or instance_place(x, sprite_get_ycenter_object(prtPlayer) + 16, prtMovingPlatformSolid).dead){
            y = round(sprite_get_ycenter_object(prtPlayer) + 24 + global.yspeed);
			
			//This pushes us out of ceiling/ground solids we may be jumping into if needs be.
			if place_meeting(x, y, objSolid)
			{
				var mySolid = instance_place(x, y, objSolid)
				if mySolid >= 0
				{
					if y <= round(mySolid.y)
						y += round(mySolid.bbox_top - bbox_bottom);
					else
						y += round(mySolid.bbox_bottom - bbox_top);
				}
			}
			else if place_meeting(x, y, prtMovingPlatformSolid)
			{
				var mySolid = instance_place(x, y, prtMovingPlatformSolid)
				if mySolid >= 0 && !mySolid.dead
				{
					if y <= round(mySolid.y)
						y += round(mySolid.bbox_top - bbox_bottom);
					else
						y += round(mySolid.bbox_bottom - bbox_top);
				}
			}
        }
        else {
            y = round(sprite_get_ycenter_object(prtPlayer) - 8);
        }
		
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
        
        if round(y+16+teleportY) <= global.viewY || round(y+16+teleportY) <= 0
            instance_destroy();
    }
}

if debug_mode || cfgDebug {
    draw_set_color(c_white);
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
    draw_arrow(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter() + xspeed * 10, sprite_get_ycenter() + yspeed * 10, 10);
}


