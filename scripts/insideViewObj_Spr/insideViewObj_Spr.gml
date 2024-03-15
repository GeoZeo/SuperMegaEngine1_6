/// @description  insideViewObj(obj)
function insideViewObj_Spr(argument0) {
	//Returns true if the object's sprite intersects with the view in any capacity, and false if not
	//This script only works for view 0

	var obj = argument0;

	if obj.bbox_right-1 >= __view_get( e__VW.XView, 0 ) && obj.bbox_left < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )
	&& obj.bbox_bottom-1 >= __view_get( e__VW.YView, 0 ) && obj.bbox_top < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )
	    return true;
	else
	    return false;



}
