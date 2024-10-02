if !(instance_exists(objFadeIn)) {
	
	__background_set(e__BG.HSpeed, 0, -1);
	
	if y < scroll_threshold {
	    vspeed = 0;
	    if global.keyPausePressed && megamansprite = global.spriteJump && jetx - sprite_get_xoffset(jetsprite) > global.viewWidth {
	        stopAllSFX();
	        game_restart();
	    }

	    if megamanx < 230 {
	        megamanx++;
	        megamany -= 0.45;
	    }
	    else {
	        megamansprite = global.spriteJump;
	    }
	
		if sprite_get_number(megamansprite) > 1 {
			if floor(megaImg) == 0 {
			    megaImg += 1 / global.blinkTimerMax;
			}
			else {
			    megaImg += 1 / global.blinkDuration;
			}
			if megaImg >= 2 {
			    megaImg = 0;
			}
		}
	
	    jetx++;
	    jety -= 0.45;
	}
	else if global.keyJump || global.keyPause {
	    vspeed = -1;
	}
	else if global.keyShoot {
		vspeed = -0.04;
	}
	else {
	    vspeed = -0.2;
	}
}
else {
	vspeed = 0;
}

