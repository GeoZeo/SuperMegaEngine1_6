var spawn_area_null = 
	spawn_area_x1 == -1000000 || spawn_area_x2 == -1000000 ||
	spawn_area_y1 == -1000000 || spawn_area_y2 == -1000000
;

var action_area_null = 
	action_area_x1 == -1000000 || action_area_x2 == -1000000 ||
	action_area_y1 == -1000000 || action_area_y2 == -1000000
;

var spawn_in_view = insideViewRect(spawn_area_x1, spawn_area_y1, spawn_area_x2, spawn_area_y2, true, false);
var action_in_view = insideViewRect(action_area_x1, action_area_y1, action_area_x2, action_area_y2, true, false);

//"Die" (doesn't actually destroy the enemy though)
if healthpoints <= 0 {
    event_user(15);
    if canInitDeath {
		beenOutsideView = false;
        visible = false;
        dead = true;    //Enemies don't actually destroy themselves, they become invisible and all collision is neglected
        x = xstart;     
        y = ystart;
        canInitDeath = false;
        xspeed = 0;
        yspeed = 0;
		
		if spawnGrounded
		{
			var _old_xstart = x;
			var _old_ystart = y;
				
			escapeWall(true, true, true, true);
				
			if !place_meeting(x, y+1, objSolid)
			&& !place_meeting(x, y+1, objBossDoorH)
			&& !place_meeting(x, y+1, objTopSolid)
			&& (!place_meeting(x, y+1, prtMovingPlatformSolid) or instance_place(x, y+1, prtMovingPlatformSolid).dead)
			&& (!place_meeting(x, y+1, prtMovingPlatformJumpthrough) or instance_place(x, y+1, prtMovingPlatformJumpthrough).dead or instance_place(x, y+1, prtMovingPlatformJumpthrough).object_index == objRushJet)
			{
				var dist = 1;
				while dist < 300
				{
					if place_meeting(x, y+dist, objSolid)
					|| place_meeting(x, y+dist, objBossDoorH)
					|| place_meeting(x, y+dist+1, objTopSolid)
					|| (place_meeting(x, y+dist, prtMovingPlatformSolid) and !instance_place(x, y+dist, prtMovingPlatformSolid).dead)
					|| (place_meeting(x, y+dist+1, prtMovingPlatformJumpthrough) and !instance_place(x, y+dist+1, prtMovingPlatformJumpthrough).dead and instance_place(x, y+dist+1, prtMovingPlatformJumpthrough).object_index != objRushJet)
					{
						break;
					}
					else
					{
						dist++;
					}
				}
					
				y += dist;
			}
				
			xstart += x - _old_xstart;
			ystart += y - _old_ystart;
				
			if !spawn_area_null
			{
				spawn_area_x1 += x - _old_xstart;
				spawn_area_x2 += x - _old_xstart;
				spawn_area_y1 += y - _old_ystart;
				spawn_area_y2 += y - _old_ystart;
			}
				
			if !action_area_null
			{
				action_area_x1 += x - _old_xstart;
				action_area_x2 += x - _old_xstart;
				action_area_y1 += y - _old_ystart;
				action_area_y2 += y - _old_ystart;
			}
				
			spawn_in_view = insideViewRect(spawn_area_x1, spawn_area_y1, spawn_area_x2, spawn_area_y2, true, false);
			action_in_view = insideViewRect(action_area_x1, action_area_y1, action_area_x2, action_area_y2, true, false);
		}
    }   
}

//Respawning
if respawn {
    if beenOutsideView { 
		if (((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite)) || (!spawn_area_null and spawn_in_view)) {
			if spawnGrounded
			{
				var _old_xstart = x;
				var _old_ystart = y;
				
				escapeWall(true, true, true, true);
				
				if !place_meeting(x, y+1, objSolid)
				&& !place_meeting(x, y+1, objBossDoorH)
				&& !place_meeting(x, y+1, objTopSolid)
				&& (!place_meeting(x, y+1, prtMovingPlatformSolid) or instance_place(x, y+1, prtMovingPlatformSolid).dead)
				&& (!place_meeting(x, y+1, prtMovingPlatformJumpthrough) or instance_place(x, y+1, prtMovingPlatformJumpthrough).dead or instance_place(x, y+1, prtMovingPlatformJumpthrough).object_index == objRushJet)
				{
					var dist = 1;
					while dist < 300
					{
						if place_meeting(x, y+dist, objSolid)
						|| place_meeting(x, y+dist, objBossDoorH)
						|| place_meeting(x, y+dist+1, objTopSolid)
						|| (place_meeting(x, y+dist, prtMovingPlatformSolid) and !instance_place(x, y+dist, prtMovingPlatformSolid).dead)
						|| (place_meeting(x, y+dist+1, prtMovingPlatformJumpthrough) and !instance_place(x, y+dist+1, prtMovingPlatformJumpthrough).dead and instance_place(x, y+dist+1, prtMovingPlatformJumpthrough).object_index != objRushJet)
						{
							break;
						}
						else
						{
							dist++;
						}
					}
					
					y += dist;
				}
				
				xstart += x - _old_xstart;
				ystart += y - _old_ystart;
				
				if !spawn_area_null
				{
					spawn_area_x1 += x - _old_xstart;
					spawn_area_x2 += x - _old_xstart;
					spawn_area_y1 += y - _old_ystart;
					spawn_area_y2 += y - _old_ystart;
				}
				
				if !action_area_null
				{
					action_area_x1 += x - _old_xstart;
					action_area_x2 += x - _old_xstart;
					action_area_y1 += y - _old_ystart;
					action_area_y2 += y - _old_ystart;
				}
				
				spawn_in_view = insideViewRect(spawn_area_x1, spawn_area_y1, spawn_area_x2, spawn_area_y2, true, false);
				action_in_view = insideViewRect(action_area_x1, action_area_y1, action_area_x2, action_area_y2, true, false);
				
				if (((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite)) || (!spawn_area_null and spawn_in_view)) {
					visible = true;
			        dead = false;
					dying = false;
			        healthpoints = healthpointsStart;
			        canInitDeath = true;
			        beenOutsideView = false;
					deathChecked = false;
				}
			}
			else
			{
				visible = true;
			    dead = false;
				dying = false;
			    healthpoints = healthpointsStart;
			    canInitDeath = true;
			    beenOutsideView = false;
				deathChecked = false;
			}
		}
    }
}
else if dead {
	instance_destroy(); //If we can't respawn, there's no point to still be able to execute any code. Destroying the instance saves memory and processing power
}

if !((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite)) && ((spawn_area_null or !spawn_in_view) && (action_area_null or !action_in_view)) and !neverDespawn {
	beenOutsideView = true;
    
    x = xstart;
    y = ystart;
    healthpoints = 0;
    dead = true;
    visible = false;
    xspeed = 0;
    yspeed = 0;

}
    
if dead {
    xspeed = 0;
    yspeed = 0;
    exit;
}

if !global.frozen and !dead and !dying {
	if instance_exists(prtPlayer) {
		if !checkPlayerSpriteCenter
		{
			player_x = prtPlayer.x;
			player_y = prtPlayer.y;
		}
		else
		{
			player_x = sprite_get_xcenter_object(prtPlayer);
			player_y = sprite_get_ycenter_object(prtPlayer);
		}
	}
}
else if global.frozen {
	if alarm[10] != -1
        alarm[10] += 1;
    if alarm[11] != -1
        alarm[11] += 1;
}

