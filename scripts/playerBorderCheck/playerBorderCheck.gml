/// @description playerBorderCheck(checkLeftRight, checkTop, resetXspeed)
function playerBorderCheck(argument0, argument1, argument2) {
	//Keep the player within the confines of the current section and the room

	
	var _checkLeftRight = argument0;
	var _checkTop = argument1;
	var _resetXspeed = argument2;
	
	
	var _total_xspeed = global.xspeed + global.xforce;
	var _total_yspeed = global.yspeed + global.yforce;
	
	
	//Stop movement at section borders
	if ((canMove or (instance_exists(objBeat) and objBeat.transportTimer < objBeat.transportTime)) || isSlide || isHit || isStun) && (visible or (instance_exists(objBeat) and objBeat.transportTimer < objBeat.transportTime)) {
		
		if _checkLeftRight {
		    if x > sectionRight-(7 - (image_xscale < 0)) && ((!place_meeting(x+(7 - (image_xscale < 0)), y, objSectionArrowRight) && !place_meeting(x-_total_xspeed, y, objSectionArrowRight)) or (instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)) {
		        x = sectionRight-(7 - (image_xscale < 0));
				if _resetXspeed global.xspeed = 0;
		    }
		    else if x < sectionLeft+(7 - (image_xscale > 0)) && ((!place_meeting(x-(7 - (image_xscale > 0)), y, objSectionArrowLeft) && !place_meeting(x-_total_xspeed, y, objSectionArrowLeft)) or (instance_exists(objBeat) && objBeat.transportTimer < objBeat.transportTime)) {
		        x = sectionLeft+(7 - (image_xscale > 0));
				if _resetXspeed global.xspeed = 0;
		    }    
		}
		if _checkTop {
		    if y < sectionTop - sprite_height {
		        y = sectionTop - sprite_height;
		    }
		}
	}   
    
	//Stop movement at room borders
	if _checkLeftRight {
		if x > room_width-(7 - (image_xscale < 0)) {
		    x = room_width-(7 - (image_xscale < 0));
		}
		else if x < (7 - (image_xscale > 0)) {
		    x = (7 - (image_xscale > 0));
		}
	}
	if _checkTop {
		if y < -sprite_height
		    y = -sprite_height;
	}



}
