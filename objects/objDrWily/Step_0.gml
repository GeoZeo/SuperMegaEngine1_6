if vspeed > 0 and place_meeting(x, y, objSolid) {
    sprite_index = sprWilySorry;
    vspeed = 0;
    gravity = 0;
    image_speed = 2 / room_speed;
    y += 8;
    while place_meeting(x, y, objSolid) {
        y--;
    }
    add_achievement(objJusticeAchievement);
}

if vspeed >= 0 && insideView() {
    __background_set( e__BG.Visible, 1, true );
}

if instance_exists(prtPlayer) and prtPlayer.visible {
    if prtPlayer.x > x {
        image_xscale = -1;
    }
    else {
        image_xscale = 1;
    }
}
else if instance_exists(objBossDeathTimer) {
    if objBossDeathTimer.x > x {
        image_xscale = -1;
    }
    else {
        image_xscale = 1;
    }
}

