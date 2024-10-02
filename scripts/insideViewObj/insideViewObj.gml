/// @description  insideViewObj(obj)
function insideViewObj(argument0) {
	//Returns true if the object is inside the view, and false if not
	//This script only works for view 0

	var obj = argument0;

	if sprite_get_xcenter_object(obj) >= global.viewX && sprite_get_xcenter_object(obj) < global.viewX+global.viewWidth
	&& sprite_get_ycenter_object(obj) >= global.viewY && sprite_get_ycenter_object(obj) < global.viewY+global.viewHeight
	    return true;
	else
	    return false;



}
