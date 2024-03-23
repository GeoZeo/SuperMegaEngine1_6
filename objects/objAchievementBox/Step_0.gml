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
            instance_destroy();
        }
    }
    y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 - (height / 2) * 8;
}
if phase == 1 and timer > room_speed * duration {
    phase = 2;
}

