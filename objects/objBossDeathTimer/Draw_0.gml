if isMM == true
{
    if teleporting == false
    {
        drawPlayer();
    }
    else
    {
        if teleportY == 0
        {
            if teleportTimer == 2
                image_index = 2;
            else if teleportTimer == 4
                image_index = 0;
            else if teleportTimer == 6
                image_index = 1;
            else if teleportTimer = 9
            {
                teleportY -= 7;
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
            if global.frozen == false
                teleportY -= 7;
        }
        
        drawSpriteColorSwap(prtPlayer.spriteTeleport, image_index, round(x), round(y+teleportY), global.charPrimaryColor, global.charSecondaryColor, make_colour_rgb(1.0, 1.0, 1.0),global.primaryCol,global.secondaryCol, global.outlineCol);
    }
}

