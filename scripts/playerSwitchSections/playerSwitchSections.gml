/// @description playerSwitchSections()
function playerSwitchSections() {
	//Moving from one section to the next, if possible

	//newSectionXOffset/newSectionYOffset are used to get the right section borders in the new section
	//Taking the normal X/Y coordinate would result in rounding errors in playerCameraInit(),
	//which could either cause the game to freeze or the wrong section borders to be used
	//Using 16 or 32 instead of 64 would also occassionally cause these problems, probably because of the +7/-7

	if global._health <= 0 || dead
		return false;
	
	if instance_exists(objBeat) and objBeat.transportTimer < objBeat.transportTime
		return false;
		
	var _left = (x-1)-sprite_get_xoffset(sprite_index) - (image_xscale < 0);
	var _top = y-sprite_get_yoffset(mask_index);
	var _right = (x-1)+(sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index)) - (image_xscale < 0);
	var _bottom = y+(sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	
	//collision_rectangle(_left, _top, _right, _bottom, objSectionArrow, false, false)
	
	if x > sectionRight-(7 - (image_xscale < 0)) && collision_rectangle(_left, _top, _right-global.xspeed+(7 - (image_xscale < 0)), _bottom, objSectionArrowRight, false, false) //Right
	&& !collision_rectangle(sectionRight+1, bbox_top, sectionRight+2, bbox_bottom, objSolid, false, false)
	{
	    instance_activate_object(objSectionBorderLeft);
	    instance_activate_object(objSectionBorderRight);
	    instance_activate_object(objSectionBorderTop);
	    instance_activate_object(objSectionBorderBottom);
	    instance_activate_object(objSectionArrowLeft);
	    instance_activate_object(objSectionArrowRight);
	    instance_activate_object(objSectionArrowUp);
	    instance_activate_object(objSectionArrowDown);
	    newSectionXOffset = 64;
    
	    if bbox_top <= global.viewY
	        newSectionYOffset = 96;
	    else if bbox_bottom >= global.viewY+global.viewHeight
	        newSectionYOffset = -96;
	    else
	        newSectionYOffset = 0;
        
	    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
	}
	else if x < sectionLeft+(7 - (image_xscale > 0)) && collision_rectangle(_left-global.xspeed-(7 - (image_xscale > 0)), _top, _right, _bottom, objSectionArrowLeft, false, false) //Left
	&& !collision_rectangle(sectionLeft-1, bbox_top, sectionLeft-2, bbox_bottom, objSolid, false, false)
	{
	    instance_activate_object(objSectionBorderLeft);
	    instance_activate_object(objSectionBorderRight);
	    instance_activate_object(objSectionBorderTop);
	    instance_activate_object(objSectionBorderBottom);
	    instance_activate_object(objSectionArrowLeft);
	    instance_activate_object(objSectionArrowRight);
	    instance_activate_object(objSectionArrowUp);
	    instance_activate_object(objSectionArrowDown);
	    newSectionXOffset = -64;
    
	    if bbox_top <= global.viewY
	        newSectionYOffset = 96;
	    else if bbox_bottom >= global.viewY+global.viewHeight
	        newSectionYOffset = -96;
	    else
	        newSectionYOffset = 0;
    
	    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
	}
	else if sprite_get_ycenter()+(3 * (isSlide or isStun)) > sectionBottom-7  && collision_rectangle(_left, _top, _right, sprite_get_ycenter()-global.yspeed+7, objSectionArrowDown, false, false) //Down
	&& !collision_rectangle(bbox_left+4, sectionBottom+1, bbox_right-4, sectionBottom+2, objSolid, false, false)
	{
	    instance_activate_object(objSectionBorderLeft);
	    instance_activate_object(objSectionBorderRight);
	    instance_activate_object(objSectionBorderTop);
	    instance_activate_object(objSectionBorderBottom);
	    instance_activate_object(objSectionArrowLeft);
	    instance_activate_object(objSectionArrowRight);
	    instance_activate_object(objSectionArrowUp);
	    instance_activate_object(objSectionArrowDown);
	    //newSectionXOffset = 0;
	    newSectionYOffset = 64;
		
		if bbox_left <= global.viewX
	        newSectionXOffset = 96;
	    else if bbox_right >= global.viewX+global.viewWidth
	        newSectionXOffset = -96;
	    else
	        newSectionXOffset = 0;
    
	    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
	}
	else if sprite_get_ycenter() < sectionTop+7 && collision_rectangle(_left, sprite_get_ycenter()-global.yspeed-7, _right, _bottom, objSectionArrowUp, false, false) //Up
	&& (climbing == true || ground == true) && !collision_rectangle(bbox_left+4, sectionTop-1, bbox_right-4, sectionTop-2, objSolid, false, false)
	{
	    instance_activate_object(objSectionBorderLeft);
	    instance_activate_object(objSectionBorderRight);
	    instance_activate_object(objSectionBorderTop);
	    instance_activate_object(objSectionBorderBottom);
	    instance_activate_object(objSectionArrowLeft);
	    instance_activate_object(objSectionArrowRight);
	    instance_activate_object(objSectionArrowUp);
	    instance_activate_object(objSectionArrowDown);
	    //newSectionXOffset = 0;
	    newSectionYOffset = -64;
		
		if bbox_left <= global.viewX
	        newSectionXOffset = 96;
	    else if bbox_right >= global.viewX+global.viewWidth
	        newSectionXOffset = -96;
	    else
	        newSectionXOffset = 0;
		
	    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
	}



}
