if activating {
    radius += 8;
    global.frozen = true;
	with prtPlayer canPause = false;
}
if activating and radius > 256 {
    activating = false;
    global.frozen = false;
	with prtPlayer canPause = true;
    alarm[1] = room_speed * 5;
    
}

if !global.frozen {
    if instance_exists(prtPlayer) {
        x = sprite_get_xcenter_object(prtPlayer);
        y = sprite_get_ycenter_object(prtPlayer);
    }
    
    if alarm[1] > 0 {
        with prtEnemy {
            if insideView() and damage[objTimeSlow] != 0
                update_rate = 0.2;
        }
        with prtEnemyProjectile {
            if insideView() and damage[objTimeSlow] != 0
                update_rate = 0.2;
        }
        with prtGimmick {
            if insideView() and damage[objTimeSlow] != 0 and object_index != objRushJet
				update_rate = 0.2;
        }
        with prtSolidGimmick {
            if insideView() and damage[objTimeSlow] != 0
                update_rate = 0.2;
        }
    }
}
else if alarm[1] > 0 {
    alarm[1]++;
}

