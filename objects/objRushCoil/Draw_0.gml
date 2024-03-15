if teleporting == false && teleportingUp == false
{
    drawSelf();
}
else if teleporting == true
{
    if round(__view_get( e__VW.YView, 0 )-32+teleportY) >= y && shouldLand == true
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
            if !collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false)
                canCoil = true;
            sprite_index = sprRush;
            exit;
        }
        
        if global.frozen == false
            teleportTimer += 1;
    }
    else if round(__view_get( e__VW.YView, 0 )-32+teleportY) >= __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )
    {
        instance_destroy();
    }
    else
    {
        //Teleporting downwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(__view_get( e__VW.YView, 0 )-32+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        
        if global.frozen == false
            teleportY += cfgRushTeleportSpeed;
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
            teleportY -= cfgRushTeleportSpeed;
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
        
        if global.frozen == false
            teleportY -= cfgRushTeleportSpeed;
        
        if round(y+teleportY) <= __view_get( e__VW.YView, 0 ) || round(y+teleportY) <= 0
            instance_destroy();
    }
}

