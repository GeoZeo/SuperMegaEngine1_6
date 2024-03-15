if !global.frozen {
    if !started and insideView() and instance_exists(prtPlayer) {
        started = true;
        x = prtPlayer.x;
        y = prtPlayer.y;
        with prtPlayer {
            sectionLeft = __view_get( e__VW.XView, 0 );
            sectionRight = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 );
            sectionTop = __view_get( e__VW.YView, 0 );
            sectionBottom = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 );    
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
    
        if instance_exists(prtPlayer) {
            if xspeed > 0 and position_meeting(prtPlayer.sectionRight - 16, prtPlayer.sectionTop, objSectionBorderRight)
            or xspeed < 0 and position_meeting(prtPlayer.sectionLeft, prtPlayer.sectionTop, objSectionBorderLeft)
            or yspeed > 0 and position_meeting(prtPlayer.sectionLeft, prtPlayer.sectionBottom - 16, objSectionBorderBottom)
            or yspeed < 0 and position_meeting(prtPlayer.sectionLeft, prtPlayer.sectionTop, objSectionBorderTop) {
                instance_destroy();
            }
        }
    }
}


