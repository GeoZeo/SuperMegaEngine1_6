if on /*&& other.ground*/ && sprite_index != prtPlayer.spriteTeleport && (!other.showReady and !other.teleporting) &&
(collision_point(x-8, y+8, other, false, false) && collision_point(x+8, y+8, other, false, false)
or collision_point((x-8)+(abs(global.xspeed)), y+8, other, false, false) && collision_point((x+8)-(abs(global.xspeed)), y+8, other, false, false)
or (round(other.x) == round(x)
or (round(other.x)-prevPlayerX < 0 and prevPlayerX >= round(x) and round(x) >= round(other.x))
or (round(other.x)-prevPlayerX > 0 and prevPlayerX <= round(x) and round(x) <= round(other.x)))) {
    other.x = x;
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

