/// @description insideView_Spr()
function insideView_Spr() {
	//Returns true if the object's sprite intersects with the view in any capacity, and false if not
	//This script only works for view 0

	if bbox_right-1 >= global.viewX && bbox_left < global.viewX+global.viewWidth
	&& bbox_bottom-1 >= global.viewY && bbox_top < global.viewY+global.viewHeight
	    return true;
	else
	    return false;



}
