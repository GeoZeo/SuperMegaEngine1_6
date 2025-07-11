if !global.frozen {
    if sprite_index == sprRush || sprite_index == sprRushCoil
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
    }
    else
    {
        yspeed = 0;
    }
    
    if sprite_index == sprRush
        image_speed = 7/60;
    
    if canCoil
	&& instance_exists(prtPlayer)
	&& (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime)
	{
		if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top+1, prtPlayer, false, false) >= 0
		{
			if global.yspeed > 0 && prtPlayer.bbox_bottom <= bbox_top+global.yspeed //Old yspeed and boundary box collision check
			//if global.yspeed > 1
			//&& prtPlayer.bbox_bottom <= bbox_bottom - 8 + global.yspeed 
		    && !prtPlayer.climbing
			&& !prtPlayer.isHit
			&& !prtPlayer.isStun
			{
				prtPlayer.y = bbox_top - (sprite_get_height(prtPlayer.mask_index) - sprite_get_yoffset(prtPlayer.mask_index));
		        global.yspeed = -7; //-7.53125; Rush Coil sends MM up to about 10 tiles high in MM9 and 10, it seems.
		        prtPlayer.canMinJump = false;
		        sprite_index = sprRushCoil;
		        canCoil = false;
		        alarm[0] = 60;
        
		        global.weapons[global.currentWeapon].ammo -= global.weapons[global.currentWeapon].consumption;
		        if global.weapons[global.currentWeapon].ammo <= 0
		            global.weapons[global.currentWeapon].ammo = 0;
		    }
		}
	}
    
    if collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false) && sprite_index == sprRush {
        event_perform(ev_alarm, 0);
    }
    
    y += yspeed;
}
else
{
    image_speed = 0;
    if alarm[0] != -1
        alarm[0] += 1;
}

