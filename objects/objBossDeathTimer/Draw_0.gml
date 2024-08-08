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
				if abs(prtPlayer.teleportAcc) > 0 {
					currentTeleportSpeed += abs(prtPlayer.teleportAcc);
					if currentTeleportSpeed >= abs(prtPlayer.teleportSpeed) {
						currentTeleportSpeed = abs(prtPlayer.teleportSpeed);
					}
				}
				else {
					currentTeleportSpeed = abs(prtPlayer.teleportSpeed);
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
            if global.frozen == false {
				if abs(prtPlayer.teleportAcc) > 0 {
					currentTeleportSpeed += abs(prtPlayer.teleportAcc);
					if currentTeleportSpeed >= abs(prtPlayer.teleportSpeed) {
						currentTeleportSpeed = abs(prtPlayer.teleportSpeed);
					}
				}
				else {
					currentTeleportSpeed = abs(prtPlayer.teleportSpeed);
				}
				
                teleportY -= currentTeleportSpeed;
			}
        }
        
        drawSpriteColorSwap(prtPlayer.spriteTeleport, image_index, round(x), round(y+teleportY), global.charPrimaryColor, global.charSecondaryColor, make_colour_rgb(1.0, 1.0, 1.0),global.primaryCol,global.secondaryCol, global.outlineCol);
    }
	
	//Weapon icon (when using quick weapon switching)
	if instance_exists(prtPlayer) and instance_exists(objBeat) and objBeat.carrying and objBeat.target == self.id
	{
		if prtPlayer.drawWeaponIcon {
		    if !prtPlayer.climbing
		        draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(x-8) + image_xscale, round(y-30), 1, 1, 0, c_white, 1);
		    else
		        draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(x-8), round(y-30), 1, 1, 0, c_white, 1);
		}
	}
}

