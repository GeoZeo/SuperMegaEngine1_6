event_inherited();

var centre_x = round(global.viewX + (global.viewWidth / 2));
var centre_y = round(global.viewY + (global.viewHeight / 2));
			
var spawn_zone_null = 
	spawn_area_x1 == -1000000 || spawn_area_x2 == -1000000 ||
	spawn_area_y1 == -1000000 || spawn_area_y2 == -1000000
;

var in_range;
if !spawn_zone_null {
	if centre_incl {
		in_range = 
			(centre_x >= spawn_area_x1 and centre_x <= spawn_area_x2) &&
			(centre_y >= spawn_area_y1 and centre_y <= spawn_area_y2)
		;
	}
	else {
		in_range = 
			(centre_x > spawn_area_x1 and centre_x < spawn_area_x2) &&
			(centre_y > spawn_area_y1 and centre_y < spawn_area_y2)
		;
	}
}
else {
	in_range = false;
}

if !followCamera {
	if !global.frozen and obj != noone and (insideView() or (!spawn_zone_null and in_range)) and !place_meeting(x, y, obj) {
		if instance_exists(prtPlayer) {
			if !checkPlayerSpriteCenter {
				player_x = prtPlayer.x;
				player_y = prtPlayer.y;
			}
			else {
				player_x = sprite_get_xcenter_object(prtPlayer);
				player_y = sprite_get_ycenter_object(prtPlayer);
			}
			player_image_xscale = prtPlayer.image_xscale;
		}
	
	    counter += update_rate;
	    if counter >= interval {
	        counter = 0;
	    }
	    if instance_number_alive(obj) < maxObjs and counter == 0 {
	        var instance = instance_create(x + dx, y + dy, obj);
	        instance.respawn = false;
			
			var instance_spawn_area_null = 
				instance_spawn_area_x1 == -1000000 || instance_spawn_area_x2 == -1000000 ||
				instance_spawn_area_y1 == -1000000 || instance_spawn_area_y2 == -1000000
			;

			var instance_action_area_null = 
				instance_action_area_x1 == -1000000 || instance_action_area_x2 == -1000000 ||
				instance_action_area_y1 == -1000000 || instance_action_area_y2 == -1000000
			;
				
			with instance {
					
				if !instance_spawn_area_null {
					spawn_area_x1 = other.instance_spawn_area_x1;
					spawn_area_x2 = other.instance_spawn_area_x2;
					spawn_area_y1 = other.instance_spawn_area_y1;
					spawn_area_y2 = other.instance_spawn_area_y2;
				}
					
				if !instance_action_area_null {
					action_area_x1 = other.instance_action_area_x1;
					action_area_x2 = other.instance_action_area_x2;
					action_area_y1 = other.instance_action_area_y1;
					action_area_y2 = other.instance_action_area_y2;
				}
			}
		
			if object_is_ancestor(instance.object_index, prtEnemy)
			{
				instance.player_x = player_x;
				instance.player_y = player_y;
				with instance event_user(1);
			}
			else if object_is_ancestor(instance.object_index, prtGimmick) || object_is_ancestor(instance.object_index, prtSolidGimmick)
			{
				instance.player_x = player_x;
				instance.player_y = player_y;
				with instance event_user(2);
			}
	    }
	}
}
else if !spawn_zone_null {
	if !global.frozen and obj != noone and insideViewRect(spawn_area_x1, spawn_area_y1, spawn_area_x2, spawn_area_y2, view_incl, view_incl) and !place_meeting(x, y, obj) {
		if instance_exists(prtPlayer) {
			if !checkPlayerSpriteCenter {
				player_x = prtPlayer.x;
				player_y = prtPlayer.y;
			}
			else {
				player_x = sprite_get_xcenter_object(prtPlayer);
				player_y = sprite_get_ycenter_object(prtPlayer);
			}
			player_image_xscale = prtPlayer.image_xscale;
		}
		
		if in_range {
			
			counter += update_rate;
			if counter >= interval {
			    counter = 0;
			}
			
			if instance_number_alive(obj) < maxObjs and counter == 0 {
				
				var edgeX, edgeY;
				
				switch(spawn_edge) {
					
					case spawn_edges.LEFT:
						edgeX = global.viewX + dx;
						edgeY = centre_y + dy;
						break;
					case spawn_edges.RIGHT:
						edgeX = (global.viewX + global.viewWidth) + dx;
						edgeY = centre_y + dy;
						break;
					case spawn_edges.TOP:
						edgeX = centre_x + dx;
						edgeY = global.viewY + dy;
						break;
					case spawn_edges.BOTTOM:
						edgeX = centre_x + dx;
						edgeY = (global.viewY + global.viewHeight) + dy;
						break;
					case spawn_edges.BACK:
						if player_image_xscale >= 0 {
							edgeX = global.viewX + (dx * sign(player_image_xscale));
							
						}
						else {
							edgeX = (global.viewX + global.viewWidth) + (dx * sign(player_image_xscale));
						}
						edgeY = centre_y + dy;
						break;
					case spawn_edges.FRONT:
						if player_image_xscale >= 0 {
							edgeX = (global.viewX + global.viewWidth) + (dx * sign(player_image_xscale));
						}
						else {
							edgeX = global.viewX + (dx * sign(player_image_xscale));
						}
						edgeY = centre_y + dy;
						break;
					
				}
				
		        var instance = instance_create(edgeX, edgeY, obj);
		        instance.respawn = false;
		
				if object_is_ancestor(instance.object_index, prtEnemy)
				{
					instance.player_x = player_x;
					instance.player_y = player_y;
					with instance event_user(1);
				}
				else if object_is_ancestor(instance.object_index, prtGimmick) || object_is_ancestor(instance.object_index, prtSolidGimmick)
				{
					instance.player_x = player_x;
					instance.player_y = player_y;
					with instance event_user(2);
				}
		    }
		}
	}
}

visible = false;

