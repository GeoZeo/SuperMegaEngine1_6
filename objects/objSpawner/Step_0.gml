event_inherited();

if !global.frozen and obj != noone and insideView() and !place_meeting(x, y, obj) {
	if instance_exists(prtPlayer) {
		if !checkPlayerSpriteCenter {
			player_x = prtPlayer.x;
			player_y = prtPlayer.x;
		}
		else {
			player_x = sprite_get_xcenter_object(prtPlayer);
			player_y = sprite_get_ycenter_object(prtPlayer);
		}
	}
	
    counter += update_rate;
    if counter >= interval {
        counter = 0;
    }
    if instance_number_alive(obj) < maxObjs and counter == 0 {
        var instance = instance_create(x + dx, y + dy, obj);
        instance.respawn = false;
		
		if object_is_ancestor(instance.object_index, prtEnemy)
		{
			instance.player_x = player_x;
			instance.player_y = player_y;
			with instance event_user(1);
		}
    }
}

visible = false;

