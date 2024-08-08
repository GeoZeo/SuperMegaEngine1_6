event_inherited();

if global.frozen == false
{
    if sprite_index == sprRushJet
    {
        if canJet == true //Waiting for Megaman
        {
        
            if !dead && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top-1, prtPlayer, false, false) >= 0
            {
                if instance_exists(prtPlayer)
                {
                    if prtPlayer.ground == true
					&& prtPlayer.isHit == false
					&& prtPlayer.isStun == false
					&& prtPlayer.bbox_bottom <= bbox_top
					&& global.yspeed >= 0
                    {
                        canJet = false;
                        alarm[0] = -1;
                    }
                }
            }
        }
        else //Flying
        {   
            //Take away ammo
            decreaseAmmoTimer += decreaseAmmoTimerIncrement;
            if decreaseAmmoTimer >= decreaseAmmoTimerMax {
                decreaseAmmoTimer = 0;
                global.weapons[global.currentWeapon].ammo -= global.weapons[global.currentWeapon].consumption;
                if global.weapons[global.currentWeapon].ammo <= 0
                {
                    global.weapons[global.currentWeapon].ammo = 0;
                    event_perform(ev_alarm, 0);
                }
            }
            
            if !dead && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top-1, prtPlayer, false, false) >= 0
            {
				if instance_exists(prtPlayer)
                {
                    if prtPlayer.ground == true && prtPlayer.bbox_bottom <= bbox_top && global.yspeed >= 0
                    {
						decreaseAmmoTimerIncrement = 1;
		                xspeed = spd * image_xscale;
				
						//Set player properties
		                prtPlayer.canWalk = false;
		                global.xspeed = 0;
						global.yspeed = 0;
		                prtPlayer.onRushJet = true;
                
		                //Move vertically
		                if global.keyUp && !place_meeting(prtPlayer.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, objSolid)
		                && !place_meeting(x, y-abs(yspeed)-1, objSolid)
		                {
		                    if !place_meeting(prtPlayer.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid)
		                    && !place_meeting(x, y-abs(yspeed)-1, prtMovingPlatformSolid)
		                        yspeed = -ySpd;
		                    else if place_meeting(prtPlayer.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid)
		                    {
		                        if instance_place(prtPlayer.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid).dead == true
		                            yspeed = -ySpd;
								else
									yspeed = 0;
		                    }
		                    else {
		                        var plt = instance_place(x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid);
		                        if plt < 0 || plt.dead
		                            yspeed = -ySpd;
								else
									yspeed = 0;
		                    }
		                }
		                else if global.keyDown && !place_meeting(x, y+abs(yspeed)+1, objSolid)// && !place_meeting(x, y+abs(yspeed)+1, objTopSolid)
		                {
		                    if !place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformSolid)// && !place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformJumpthrough)
		                        yspeed = ySpd;
		                    else if place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformSolid)
		                    {
		                        if instance_place(x, y+abs(yspeed)+1, prtMovingPlatformSolid).dead == true
		                            yspeed = ySpd;
								else
									yspeed = 0;
		                    }
		                }
		                else
		                    yspeed = 0;
					}
				}
            }
            else
            {
                with prtPlayer
                {
                    if onRushJet == true
                    {
                        onRushJet = false;
                        canWalk = true;
                    }
                }
                
                yspeed = 0;
            }
        }
        
        if place_meeting(x, y, objSolid) {
            event_perform(ev_alarm, 0);
        }
		else if place_meeting(x, y, prtMovingPlatformSolid)
        {
            if instance_place(x, y, prtMovingPlatformSolid).dead == false
                event_perform(ev_alarm, 0);
        }
        
        image_speed = 0.25;
    }
}
else {
    image_speed = 0;
    if alarm[0] != -1
        alarm[0] += 1;
}

