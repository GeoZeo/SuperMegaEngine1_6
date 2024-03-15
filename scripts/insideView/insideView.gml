/// @description insideView()
function insideView() {
	//Returns true if the object is inside the view, and false if not
	//This script only works for view 0

	if sprite_get_xcenter() >= __view_get( e__VW.XView, 0 ) && sprite_get_xcenter() < __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )
	&& sprite_get_ycenter() >= __view_get( e__VW.YView, 0 ) && sprite_get_ycenter() < __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )
	    return true;
	else
	    return false;



}
