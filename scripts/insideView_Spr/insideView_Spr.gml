/// @description insideViewSpr()
function insideView_Spr() {
	//Returns true if the object's sprite intersects with the view in any capacity, and false if not
	//This script only works for view 0

	if bbox_right-1 >= __view_get( e__VW.XView, 0 ) && bbox_left < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )
	&& bbox_bottom-1 >= __view_get( e__VW.YView, 0 ) && bbox_top < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )
	    return true;
	else
	    return false;



}
