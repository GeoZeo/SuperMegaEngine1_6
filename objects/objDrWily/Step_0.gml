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
	    if !instance_exists(objMegamanDeathTimer) add_achievement(objJusticeAchievement);
	}
	
	if sprite_index == sprWilySorry && image_speed == 0 {
		image_speed = ((240 / 119) * 2) / room_speed;
	}

	if !insideView() {
		if !finishedMove {
			gravity = 0;
			vspeed = 0;
		}
		x = round(global.viewX + ((((global.viewX + global.viewWidth) - global.viewX) / 4) * 3));
		if moveMM {
			instance_create(572, 592, objArenaStartingPoint);
			moveMM = false;
		}
	}
	if revealBackground && blackAlpha < 1 {
		blackAlphaTimer += 1;

		if blackAlphaTimer >= blackAlphaTimerMax {
		    blackAlpha += blackAlphaIncrease;
		    blackAlphaTimer = 0;
			
			if blackAlpha >= 1 {
				blackAlpha = 1;
				gravity = 0.25;
			}
			
			__background_set( e__BG.Alpha, 1, blackAlpha );
		}
	}
}
else {
	image_speed = 0;
}

