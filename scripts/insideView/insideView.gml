/// @description insideView()
function insideView() {
	//Returns true if the object is inside the view, and false if not
	//This script only works for view 0

	if sprite_get_xcenter() >= global.viewX && sprite_get_xcenter() < global.viewX+global.viewWidth
	&& sprite_get_ycenter() >= global.viewY && sprite_get_ycenter() < global.viewY+global.viewHeight
	    return true;
	else
	    return false;



}
