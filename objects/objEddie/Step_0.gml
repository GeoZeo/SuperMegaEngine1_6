if !global.frozen {
    if instance_exists(prtPlayer) {
        player_x = prtPlayer.x;
		player_y = prtPlayer.y;
    }
	
	var _y1 = y;
	
	if sprite_index == sprEddie
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
    }
    else
    {
        yspeed = 0;
    }
	
	if !teleporting && !leaving {  //Ready to work
		if (!delivering and abs(player_x - x) > 48
		and !place_meeting(x + image_xscale, y, objSolid)
		and !place_meeting(x + image_xscale, y, prtMovingPlatformSolid)
		and !place_meeting(x + image_xscale, y, objBossDoor))
		|| (!ground and !delivering)  { //Walking towards Mega Man
		    if (!place_meeting(x + image_xscale, y, objSolid)
			and !place_meeting(x + image_xscale, y, prtMovingPlatformSolid)
			and !place_meeting(x + image_xscale, y, objBossDoor)) {
				xspeed = image_xscale * spd;
			    x += xspeed;
			}
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
		    if (image_index < 3 and image_speed != 0 and !delivered) || !delivering {
		        image_speed = anim_spd;
		        image_index = 3;
				delivering = true;
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
				var item_instance = instance_create(x + sign(image_xscale) * 8, y - 14, item);
				if image_xscale > 0 item_instance.x -= (item_instance.sprite_width - item_instance.sprite_xoffset);
				with item_instance escapeWall(true, true, true, true);
		        item_instance.xspeed = image_xscale;
		        item_instance.yspeed = -4;
				if !called {
					item_instance.fromStageEddie = true;
					myItem = item_instance;
				}
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
	
	var _y2 = y;
	
	if collision_rectangle(x-5, bbox_bottom-1, x+5, bbox_bottom, prtMovingPlatformSolid, false, false)
	&& !collision_rectangle(x-5, bbox_bottom-1, x+5, bbox_bottom, prtMovingPlatformSolid, false, false).dead
	&& collision_rectangle(x-5, bbox_bottom-1, x+5, bbox_bottom, prtMovingPlatformSolid, false, false).yspeed > 0
	&& sprite_index == sprEddie {
		y = _y1; //Eddie's stuck code below occurs when he's on a solid moving platform that's going down for some reason, despite Rush being coded more or less the same way and not having the same issue...
	}
	
	if (collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false)
	or collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objBossDoor, false, false)
	or (collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, prtMovingPlatformSolid, false, false)
	and !collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, prtMovingPlatformSolid, false, false).dead)) && sprite_index == sprEddie {
		stuck = true;
        event_perform(ev_alarm, 0);
    }
	
	y = _y2;
	
	y += yspeed;
	
	prev_img_index = image_index;
}
else {
	if !teleporting && !leaving
		if image_index != prev_img_index
			image_index = prev_img_index;
	else
		image_speed = 0;
		
    if alarm[0] > 0 {
        alarm[0]++;
    }
}

