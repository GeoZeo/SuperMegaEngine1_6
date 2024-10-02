if !global.frozen {
	if vspeed > 0 and place_meeting(x, y, objSolid) {
	    sprite_index = sprWilySorry;
	    vspeed = 0;
	    gravity = 0;
	    image_speed = ((240 / 119) * 2) / room_speed;
	    y += 8;
		y = round(y);
	    while place_meeting(x, y, objSolid) {
	        y--;
	    }
	    add_achievement(objJusticeAchievement);
	}
	
	if sprite_index == sprWilySorry && image_speed == 0 {
		image_speed = ((240 / 119) * 2) / room_speed;
	}

	if instance_exists(prtPlayer) && !insideView_Spr() {
		x = round(prtPlayer.sectionLeft + (((prtPlayer.sectionRight - prtPlayer.sectionLeft) / 4) * 3));
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
}
else {
	image_speed = 0;
}

