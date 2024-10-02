/// @description  insideViewAny(obj)
function insideViewAny(argument0) {
	//Returns an object if any object of this type is inside the view, and -1 otherwise
	//This script only works for view 0

	var obj = argument0;

	with obj {
	    if sprite_get_xcenter() >= global.viewX && sprite_get_xcenter() < global.viewX+global.viewWidth
	    && sprite_get_ycenter() >= global.viewY && sprite_get_ycenter() < global.viewY+global.viewHeight
	        return self;
	}
	return -1;



}
