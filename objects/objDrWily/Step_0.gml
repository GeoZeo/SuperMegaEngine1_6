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

	if !insideView_Spr() {
		x = round(global.viewX + ((((global.viewX + global.viewWidth) - global.viewX) / 4) * 3));
	}
	if vspeed >= 0 && insideView() {
	    revealBackground = true;
	}
	if revealBackground && blackAlpha < 1 {
		blackAlphaTimer += 1;

		if blackAlphaTimer >= blackAlphaTimerMax {
		    blackAlpha += blackAlphaIncrease;
		    blackAlphaTimer = 0;
			
			if blackAlpha >= 1 {
				blackAlpha = 1;
			}
			
			__background_set( e__BG.Alpha, 1, blackAlpha );
		}
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

