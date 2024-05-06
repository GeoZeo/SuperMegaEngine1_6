if on /*&& other.ground*/ && sprite_index != prtPlayer.spriteTeleport && (!other.showReady and !other.teleporting) && !global.frozen &&
(collision_point(x-(sprite_width/2), y+(sprite_height/2), other, false, false) && collision_point(x+(sprite_width/2), y+(sprite_height/2), other, false, false)
or collision_point((x-(sprite_width/2))+(abs(global.xspeed)), y+(sprite_height/2), other, false, false) && collision_point((x+(sprite_width/2))-(abs(global.xspeed)), y+(sprite_height/2), other, false, false)
or (((round(other.x) == x)
or (other.x-prevPlayerX < 0 and prevPlayerX >= x and x >= other.x)
or (other.x-prevPlayerX > 0 and prevPlayerX <= x and x <= other.x))
or ((round(mask_get_xcenter_object(prtPlayer)) == x)
or (mask_get_xcenter_object(prtPlayer)-prevMaskX < 0 and prevMaskX >= x and x >= mask_get_xcenter_object(prtPlayer))
or (mask_get_xcenter_object(prtPlayer)-prevMaskX > 0 and prevMaskX <= x and x <= mask_get_xcenter_object(prtPlayer))))) {
    if image_xscale != other.image_xscale
		image_xscale = other.image_xscale;
	if image_yscale != other.image_yscale
		image_yscale = other.image_yscale;
	
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
	if !water
		other.inWater = false;
		
    //instance_deactivate_object(objMegaman);
    playerLockMovement();
	other.canGravity = false;
	stopSFX(sfxLand);
    playSFX(sfxTeleportIn);
    instance_activate_object(objSectionBorderLeft);
    instance_activate_object(objSectionBorderRight);
    instance_activate_object(objSectionBorderTop);
    instance_activate_object(objSectionBorderBottom);    
    show_debug_message("Teleport start! Going to ("+string(toX)+","+string(toY)+")");

}

