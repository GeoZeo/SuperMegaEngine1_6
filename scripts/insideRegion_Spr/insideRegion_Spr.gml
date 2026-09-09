/// @description insideRegion_Spr(left, top, right, bottom)
function insideRegion_Spr(argument0, argument1, argument2, argument3) {
	//Returns true if the object's sprite intersects with the region in any capacity, and false if not

	if bbox_right-1 >= argument0 && bbox_left < argument2
	&& bbox_bottom-1 >= argument1 && bbox_top < argument3
	    return true;
	else
	    return false;



}
