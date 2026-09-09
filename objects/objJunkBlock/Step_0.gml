event_inherited();

if !global.frozen {
    checkGround();
    gravityCheckGround();
    generalCollision();
    move(xspeed * update_rate, yspeed * update_rate);
    
    if yspeed > 0 and instance_exists(prtPlayer) and prtPlayer.ground and collision_rectangle(bbox_left + 1, bbox_bottom - 1, bbox_right - 1, bbox_bottom, prtPlayer, 1, true) {
        with prtPlayer skipCrushY = true;
		with prtPlayer playerGetHit(8, true);
		
		var _old_x = prtPlayer.x;
		var _old_y = prtPlayer.y;
		
		with prtPlayer
		{
			escapeWall(true, true, false, false);
			if x > sectionRight - (6 - (image_xscale < 0)) && !place_meeting(x+(6 - (image_xscale < 0)), y, objSectionArrowRight) && !place_meeting(x-global.xspeed, y, objSectionArrowRight)
			{
				x = _old_x;
				y = _old_y;
				escapeWall(true, false, false, false);
			}
			else if x < sectionLeft + (6 - (image_xscale > 0)) && !place_meeting(x-(6 - (image_xscale > 0)), y, objSectionArrowLeft) && !place_meeting(x-global.xspeed, y, objSectionArrowLeft)
			{
				x = _old_x;
				y = _old_y;
				escapeWall(false, true, false, false);
			}
		}
    }
}

