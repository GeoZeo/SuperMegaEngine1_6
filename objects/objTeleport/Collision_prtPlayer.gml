if on /*&& other.ground*/ && sprite_index != prtPlayer.spriteTeleport && collision_point(x + 8, y + 8, other, false, false) {
    x = other.x;
    y = other.y;
    visible = true;
    sprite_index = prtPlayer.spriteTeleport;
    image_speed = prtPlayer.speedTeleport;
    with other {
        visible = false;
        global.xspeed = 0;
        global.yspeed = 0;
		canHit = false;
    }
    //instance_deactivate_object(objMegaman);
    playerLockMovement();
	stopSFX(sfxLand);
    playSFX(sfxTeleportIn);
    instance_activate_object(objSectionBorderLeft);
    instance_activate_object(objSectionBorderRight);
    instance_activate_object(objSectionBorderTop);
    instance_activate_object(objSectionBorderBottom);    
    show_debug_message("Teleport start! Going to ("+string(toX)+","+string(toY)+")");

}
else {

}
