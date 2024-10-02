/// @description  insideViewObj(obj)
function insideViewObj_Spr(argument0) {
	//Returns true if the object's sprite intersects with the view in any capacity, and false if not
	//This script only works for view 0

	var obj = argument0;

	if obj.bbox_right-1 >= global.viewX && obj.bbox_left < global.viewX+global.viewWidth
	&& obj.bbox_bottom-1 >= global.viewY && obj.bbox_top < global.viewY+global.viewHeight
	    return true;
	else
	    return false;



}
