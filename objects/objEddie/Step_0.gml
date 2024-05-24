if !global.frozen {
    if !instance_exists(prtPlayer) and insideView() {
        instance_destroy();
        exit;
    }
    if !leaving and sprite_index == sprRushTeleport {    //Teleporting in
        if image_index == 0 {   //Falling
            if yspeed == 0 and insideView() {
                y = __view_get( e__VW.YView, 0 );
                yspeed = cfgRushTeleportSpeed;
				visible = true;
            }
            if (!called or abs(prtPlayer.y - y) < 64) and place_meeting(x, y + yspeed, objSolid) and place_free(x, y) {
                image_speed = anim_spd * 2;
                while !place_meeting(x, y + 1, objSolid) {
                    y++;
                }
            }
            else {
                y += yspeed;
            }
        }
        else if image_index >= 2 {  //Morphing
            sprite_index = sprEddie;
            image_index = 1;
            while !place_meeting(x, y + 1, objSolid) {
                y++;
            }
            if prtPlayer.x < x {
                image_xscale = -1;
            }
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
        if (!delivering and abs(prtPlayer.x - x) > 48 and !place_meeting(x + image_xscale, y, objSolid)) || mySolid < 0   { //Walking towards Mega Man
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
                var item = choose(objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLifeEnergyBig, objWeaponEnergyBig, objLife, objLife, objETank);
                var item_instance = instance_create(x + image_xscale * 8, y - 16, item);
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
        if image_index < 1 {
            image_speed = 0;
            yspeed = -cfgRushTeleportSpeed;
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

