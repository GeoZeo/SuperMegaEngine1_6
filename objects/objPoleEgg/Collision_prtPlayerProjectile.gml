if canPlayerInteract {
	with other x = new_x;
	with other y = new_y;
	if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
	healthpoints -= damage[other.object_index];
	if !hitWhite || healthpoints <= 0 visible = false; isHit = true;
	alarm[11] = flashTime;
	with other event_user(14);
	if healthpoints <= 0 {
	    dead = true;
	    var _explosion = instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objEnemyExplosion);
		with _explosion
		{
			my_x = sprite_get_xcenter();
			my_y = sprite_get_ycenter();
			my_enemy = objPole;
			my_player_x = other.player_x;
			my_player_y = other.player_y;
		}
	    if !other.passThrough and ! other.unstoppable {
	        with other {
				event_user(15);
				instance_destroy();
			}
	    }
	    instance_destroy();
	}
	else if !other.unstoppable {
	    with other {
			event_user(15); 
			instance_destroy();
		}
	}
}

