/// @description  insideViewAny_Spr(obj)
function insideViewAny_Spr(argument0) {
	//Returns an object if any object of this type's sprite intersects with the view in any capacity, and -1 otherwise
	//This script only works for view 0

	var obj = argument0;

	with obj {
	    if bbox_right-1 >= global.viewX && bbox_left < global.viewX+global.viewWidth
	    && bbox_bottom-1 >= global.viewY && bbox_top < global.viewY+global.viewHeight
	        return self;
	}
	return -1;



}
