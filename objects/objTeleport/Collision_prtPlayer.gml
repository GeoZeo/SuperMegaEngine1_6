if on && sprite_index != prtPlayer.spriteTeleport && (!other.showReady and !other.teleporting and !other.isHit) && !global.frozen //&& other.ground
&& (round(other.x) == x || (abs(global.xspeed+other.pltSpeedX) > 1 and (other.x >= (x-other.image_xscale)-2 and other.x <= (x-other.image_xscale)+2) and sign(global.xspeed+other.pltSpeedX) != sign(other.x - x)) || (abs(global.xspeed+other.pltSpeedX) <= 1 and round(other.x) == (x-other.image_xscale))) {
    if image_xscale != other.image_xscale
		image_xscale = other.image_xscale;
	if image_yscale != other.image_yscale
		image_yscale = other.image_yscale;
	
	other.x = x;
    y = other.y;
    visible = true;
	fromItem = false;
    sprite_index = prtPlayer.spriteTeleport;
    image_speed = prtPlayer.speedTeleport;
    with other {
        visible = false;
        global.xspeed = 0;
        global.yspeed = 0;
		canHit = false;
		isHit = false;
	    drawHitspark = false;
	    hitTimer = 0;
		invincibilityTimer = 0;
		
		if !cfgSwitchWeaponsWhileLocked {
			drawWeaponIconTimer = -1;
			drawWeaponIcon = false;
		}
    }
		
    //instance_deactivate_object(objMegaman);
	with objPauseMenu instance_destroy();
	stopSFX(sfxPause);
    playerLockMovement();
	other.canGravity = false;
	with objWind playerTeleporting = true;
	stopSFX(sfxLand);
    playSFX(sfxTeleportIn);
    instance_activate_object(objSectionBorderLeft);
    instance_activate_object(objSectionBorderRight);
    instance_activate_object(objSectionBorderTop);
    instance_activate_object(objSectionBorderBottom);    
    show_debug_message("Teleport start! Going to ("+string(toX-(cfgPushStartingPosBack*toDir))+","+string(toY)+")");

}

