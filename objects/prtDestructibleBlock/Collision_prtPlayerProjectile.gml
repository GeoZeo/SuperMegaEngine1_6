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
	    instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
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

