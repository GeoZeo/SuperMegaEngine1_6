if !global.frozen {
    if instance_exists(prtPlayer) {
        player_x = prtPlayer.x;
		player_y = prtPlayer.y;
    }
    if !leaving and sprite_index == sprRushTeleport {    //Teleporting in
        if teleportTimer == 0 {   //Falling
			if insideView_Spr() {
				if yspeed == 0 {
					y = global.viewY-16;
					visible = true;
					if abs(cfgRushTeleportAcc) <= 0 {
						yspeed = cfgRushTeleportSpeed;
					}
					else {
						yspeed += cfgRushTeleportAcc;
						if yspeed >= abs(cfgRushTeleportSpeed) {
							yspeed = cfgRushTeleportSpeed;
						}
					}
				}
				else if abs(cfgRushTeleportAcc) > 0 && yspeed < abs(cfgRushTeleportSpeed) {
					yspeed += cfgRushTeleportAcc;
					if yspeed >= abs(cfgRushTeleportSpeed) {
						yspeed = cfgRushTeleportSpeed;
					}
				}
			}
            //if yspeed == 0 and insideView() {
            //    y = __view_get( e__VW.YView, 0 );
				
			//	if abs(cfgRushTeleportAcc) > 0 {
			//		yspeed += cfgRushTeleportAcc;
			//		if yspeed >= abs(cfgRushTeleportSpeed) {
			//			yspeed = cfgRushTeleportSpeed;
			//		}
			//	}
			//	else {
			//		yspeed = cfgRushTeleportSpeed;
			//	}
				
			//	visible = true;
            //}
            if (!called or abs(player_y - y) < 64) and place_meeting(x, y + yspeed, objSolid) and place_free(x, y) {
                
				if teleportTimer == 0
					playSFX(sfxTeleportIn);
				
				teleportTimer++;
                while !place_meeting(x, y + 1, objSolid) {
                    y++;
                }
            }
            else {
                y += yspeed;
            }
        }
        else if teleportTimer == 9 {  //Morphing
            teleportTimer = 0;
			if called itemsLeft = itemsCalled;
			image_speed = anim_spd * 2;
			sprite_index = sprEddie;
            image_index = 1;
            while !place_meeting(x, y + 1, objSolid) {
                y++;
            }
            if player_x < x {
                image_xscale = -1;
            }
        }
		else {
			teleportTimer++;
			if teleportTimer == 2
	            image_index = 1;
	        else if teleportTimer == 4
	            image_index = 0;
	        else if teleportTimer == 6
	            image_index = 2;
		}
    }
    else if !leaving {  //Ready to work
		var mySolid = instance_place(x, y + 1, objSolid);
		if mySolid < 0 {
	        yspeed += cfgGravity;
	        y += yspeed;
		}
	    else if yspeed > 0 {
			y = mySolid.bbox_top;
			while place_meeting(x, y, mySolid)
			    y -= 1;
				
	        yspeed = 0;
	    }
        if (!delivering and abs(player_x - x) > 48 and !place_meeting(x + image_xscale, y, objSolid)) || mySolid < 0   { //Walking towards Mega Man
            xspeed = image_xscale * spd;
            x += xspeed;
            if image_index >= 3 and image_speed > 0 {
                image_speed = -anim_spd;
                image_index = 2.9;
            }
            else if image_index >= 3 and image_speed < 0 {
                image_speed = anim_spd;
                image_index = 0;
            }
        }
        else {  //Throw item
            delivering = true;
            if image_index < 3 and image_speed != 0 and !delivered {
                image_speed = anim_spd;
                image_index = 3;
            }
            else if image_index > 5 and !delivered {
                delivered = true;
				itemsLeft--;
				var item;
				if called {
					if global.enableScrews {
						randomize();
						item = choose(objLifeEnergySmall, objWeaponEnergySmall, objScrewSmall, objLifeEnergySmall, objWeaponEnergySmall, objScrewSmall, objLifeEnergySmall, objWeaponEnergySmall, objScrewSmall, objLifeEnergySmall, objWeaponEnergySmall, objScrewSmall, objLifeEnergyBig, objWeaponEnergyBig, objScrewBig, objLifeEnergyBig, objWeaponEnergyBig, objScrewBig, objLife, objLife, objETank);
					}
					else {
						randomize();
						item = choose(objLifeEnergySmall, objWeaponEnergySmall, objLifeEnergySmall, objWeaponEnergySmall, objLifeEnergySmall, objWeaponEnergySmall, objLifeEnergySmall, objWeaponEnergySmall, objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLife, objLife, objETank);
					}
				}
				else {
					if global.enableScrews {
						randomize();
						item = choose(objLifeEnergyBig, objWeaponEnergyBig, objScrewBig, objLifeEnergyBig, objWeaponEnergyBig, objScrewBig, objLifeEnergyBig, objWeaponEnergyBig, objScrewBig, objLifeEnergyBig, objWeaponEnergyBig, objScrewBig, objLife, objLife, objETank);
					}
					else {
						randomize();
						item = choose(objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLife, objLife, objETank);
					}
				}
				var item_instance = instance_create(x + sign(image_xscale) * 8, y - 16, item);
				if image_xscale > 0 item_instance.x -= (item_instance.sprite_width - item_instance.sprite_xoffset);
				with item_instance escapeWall(true, true, true, true);
                item_instance.xspeed = image_xscale;
                item_instance.yspeed = -4;
            }
            else if image_index > 5.5 and delivered {
                image_index = 5.5;
                image_speed = -anim_spd;
            }
            else if image_speed < 0 and image_index <= 4.2 and delivered {
                image_index = 1;
                image_speed = 0;
                alarm[0] = room_speed;
            }
        }
    }
    else {
		if teleportTimer < 9 teleportTimer++;
		if teleportTimer == 2
	        image_index = 1;
	    else if teleportTimer == 4
	        image_index = 0;
	    else if teleportTimer == 6
	        image_index = 2;
		
        if teleportTimer == 9 {
			image_index = 0;
            image_speed = 0;
			
            if abs(cfgRushTeleportAcc) > 0 {
				yspeed -= cfgRushTeleportAcc;
				if yspeed <= -cfgRushTeleportSpeed {
					yspeed = -cfgRushTeleportSpeed;
				}
			}
			else {
				yspeed = -cfgRushTeleportSpeed;
			}
				
            y += yspeed;
        }
    }
	prev_img_index = image_index;
}
else {
	if image_index != prev_img_index
		image_index = prev_img_index;
		
    if alarm[0] > 0 {
        alarm[0]++;
    }
}

