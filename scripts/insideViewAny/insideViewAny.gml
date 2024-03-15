/// @description  insideViewAny(obj)
function insideViewAny(argument0) {
	//Returns an object if any object of this type is inside the view, and -1 otherwise
	//This script only works for view 0

	var obj = argument0;

	with obj {
	    if sprite_get_xcenter() >= __view_get( e__VW.XView, 0 ) && sprite_get_xcenter() < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )
	    && sprite_get_ycenter() >= __view_get( e__VW.YView, 0 ) && sprite_get_ycenter() < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )
	        return self;
	}
	return -1;



}
