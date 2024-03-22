global.frozen = true;
timer++;
if timer % 3 == 0 {
    if phase == 0 {
        height += 2;
        if height >= maxHeight {
            phase = 1;
            timer = 0;
        }
    }
    if phase == 2 {
        height -= 2;
        if height <= 0 {
            global.frozen = oldFrozen;
			if instance_exists(prtPlayer)
				prtPlayer.canHit = oldPlayerCanHit; //This fixes a glitch where the create event triggering while the player is colliding with an enemy/projectile/hazard/etc. causes the player to be hit even when they're supposed to be in the middle of i-frames.
				
            instance_destroy();
        }
    }
    y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 - (height / 2) * 8;
}
if phase == 1 and timer > room_speed * duration {
    phase = 2;
}

