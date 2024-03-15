event_inherited();

if !global.frozen {
    checkGround();
    gravityCheckGround();
    generalCollision();
    move(xspeed, yspeed);
    
    if yspeed > 0 and instance_exists(prtPlayer) and prtPlayer.ground and collision_rectangle(bbox_left + 1, bbox_bottom - 1, bbox_right - 1, bbox_bottom, prtPlayer, 1, true) {
        with prtPlayer playerGetHit(8);
    }
}

