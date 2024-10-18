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
    if !started and insideView_Spr() {
		var _noOthers = true;
		
		with objAutoScroll {
			
			if id == other.id
				continue;
			
			if insideView_Spr() {
				_noOthers = false;
				break;
			}
		}
		
        if _noOthers {
			started = true;
	        x = player_x;
	        y = player_y;
	        with prtPlayer {
				if other.fixed or abs(other.xspeed) > 0 or abs(other.target_xspeed) > 0 {
		            sectionLeft = global.viewX;
		            sectionRight = global.viewX + global.viewWidth;
				}
				if other.fixed or abs(other.yspeed) > 0 or abs(other.target_yspeed) > 0 {
		            sectionTop = global.viewY;
		            sectionBottom = global.viewY + global.viewHeight;
				}
	        }
		}
    }
    else if started {
		if xaccel != 0 {
			xspeed += xaccel;
			if (xaccel > 0 and xspeed > target_xspeed) or (xaccel < 0 and xspeed < target_xspeed)
				xspeed = target_xspeed;
		}
		if yaccel != 0 {
			yspeed += yaccel;
			if (yaccel > 0 and yspeed > target_yspeed) or (yaccel < 0 and yspeed < target_yspeed)
				yspeed = target_yspeed;
		}
        x += xspeed;
        y += yspeed;
        with prtPlayer {
			if other.fixed or abs(other.xspeed) > 0 or abs(other.target_xspeed) > 0 {
	            sectionLeft += other.xspeed;
	            sectionRight += other.xspeed;
			}
			if other.fixed or abs(other.yspeed) > 0 or abs(other.target_yspeed) > 0 {
	            sectionTop += other.yspeed;
	            sectionBottom += other.yspeed;
			}
            if !place_free(x + other.xspeed, y + other.yspeed) and ((other.xspeed > 0 and x < sectionLeft) or (other.xspeed < 0 and x + sprite_width > sectionRight) or (other.yspeed > 0 and y < sectionTop) or (other.yspeed < 0 and y + sprite_height > sectionBottom)) {
                global._health = 0;
            }
        }
		if !instance_exists(prtPlayer) {
			if fixed or abs(xspeed) > 0 or abs(target_xspeed) > 0 global.viewX += other.xspeed;
			if fixed or abs(yspeed) > 0 or abs(target_yspeed) > 0 global.viewY += other.yspeed;
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


