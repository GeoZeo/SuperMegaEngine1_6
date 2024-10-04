if !global.frozen {
	if instance_exists(prtPlayer) {
		player_x = prtPlayer.x;
		player_y = prtPlayer.y;
		
		if !started {
			section_left = prtPlayer.sectionLeft;
			section_top = prtPlayer.sectionTop;
			section_right = prtPlayer.sectionRight;
			section_bottom = prtPlayer.sectionBottom;
		}
	}
    if !started and insideView() {
        started = true;
        x = player_x;
        y = player_y;
        with prtPlayer {
            sectionLeft = global.viewX;
            sectionRight = global.viewX + global.viewWidth;
            sectionTop = global.viewY;
            sectionBottom = global.viewY + global.viewHeight;    
        }
    }
    else if started {
        x += xspeed;
        y += yspeed;
        with prtPlayer {
            sectionLeft += other.xspeed;
            sectionRight += other.xspeed;
            sectionTop += other.yspeed;
            sectionBottom += other.yspeed;
            if !place_free(x + other.xspeed, y + other.yspeed) and ((other.xspeed > 0 and x < sectionLeft) or (other.xspeed < 0 and x + sprite_width > sectionRight) or (other.yspeed > 0 and y < sectionTop) or (other.yspeed < 0 and y + sprite_height > sectionBottom)) {
                global._health = 0;
            }
        }
		if !instance_exists(prtPlayer) {
			global.viewX += other.xspeed;
			global.viewY += other.yspeed;
		}
    
        if instance_exists(prtPlayer) {
            if xspeed > 0 and position_meeting(prtPlayer.sectionRight - 16, prtPlayer.sectionTop, objSectionBorderRight)
            or xspeed < 0 and position_meeting(prtPlayer.sectionLeft, prtPlayer.sectionTop, objSectionBorderLeft)
            or yspeed > 0 and position_meeting(prtPlayer.sectionLeft, prtPlayer.sectionBottom - 16, objSectionBorderBottom)
            or yspeed < 0 and position_meeting(prtPlayer.sectionLeft, prtPlayer.sectionTop, objSectionBorderTop) {
                instance_destroy();
            }
        }
		else {
			if xspeed > 0 and position_meeting((global.viewX + global.viewWidth) - 16, global.viewY, objSectionBorderRight)
            or xspeed < 0 and position_meeting(global.viewX, global.viewY, objSectionBorderLeft)
            or yspeed > 0 and position_meeting(global.viewX, (global.viewY + global.viewHeight) - 16, objSectionBorderBottom)
            or yspeed < 0 and position_meeting(global.viewX, global.viewY, objSectionBorderTop) {
				
				if xspeed > 0 {
					global.viewX = section_right - global.viewWidth;
				}
				else if xspeed < 0 {
					global.viewX = section_left + global.viewWidth;
				}
				if yspeed > 0 {
					global.viewY = section_bottom - global.viewHeight;
				}
				else if yspeed < 0 {
					global.viewY = section_top + global.viewHeight;
				}
				
                instance_destroy();
            }
		}
    }
}


