/// @description  insideViewAny(obj)
function insideViewAny_Spr(argument0) {
	//Returns an object if any object of this type's sprite intersects with the view in any capacity, and -1 otherwise
	//This script only works for view 0

	var obj = argument0;

	with obj {
	    if bbox_right-1 >= __view_get( e__VW.XView, 0 ) && bbox_left < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )
	    && bbox_bottom-1 >= __view_get( e__VW.YView, 0 ) && bbox_top < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )
	        return self;
	}
	return -1;



}
