if activating {
    radius += 8;
    global.frozen = true;    
}
if activating and radius > 256 {
    activating = false;
    global.frozen = false;
    alarm[1] = room_speed * 5;
    
}

if !global.frozen {
    if instance_exists(prtPlayer) {
        x = sprite_get_xcenter_object(prtPlayer);
        y = sprite_get_ycenter_object(prtPlayer);
    }
    
    if alarm[1] > 0 {
        with prtEnemy {
            if insideView() and damage[objTimeSlow] > 0
                update_rate = 0.2;
        }
        with prtEnemyProjectile {
            if insideView()
                update_rate = 0.2;
        }
        with prtGimmick {
            if insideView()
                update_rate = 0.2;
        }
        with prtSolidGimmick {
            if insideView()
                update_rate = 0.2;
        }
    }
}
else if alarm[1] > 0 {
    alarm[1]++;
}

