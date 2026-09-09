__background_set(e__BG.HSpeed, 0, -1);

if !(instance_exists(objFadeIn)) {
	
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
			megamanimgspeed = global.speedJump;
	    }
	
		if sprite_get_number(megamansprite) > 1 {
			megaImg += megamanimgspeed;
			if megaImg >= sprite_get_number(megamansprite) {
			    megaImg = 0;
			}
		}
		if sprite_get_number(jetsprite) > 1 {
			jetImg += jetspeed;
			if jetImg >= sprite_get_number(jetsprite) {
			    jetImg = 0;
			}
		}
		
		if megamansprite == megamanspritestand || (megamanspriteblink != -1 and megamansprite == megamanspriteblink) {
		    blinktimer++;
		    if blinkimage == 0 {
		        if blinktimer >= blinktimermax {
		            blinkimage = 1;
		            blinktimer = 0;
		        }
		    }
		    else {
		        if blinktimer >= blinkduration {
		            blinkimage = 0;
		            blinktimer = 0;
		        }
		    }
		}
		else {
		    blinktimer = 0;
		    blinkimage = 0;
		}
		
		if megamansprite != megamanspritejump {
			if blinkimage == 0 {
				megamansprite = megamanspritestand;
			}
			else if megamanspriteblink > -1 {
				megamansprite = megamanspriteblink;
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

