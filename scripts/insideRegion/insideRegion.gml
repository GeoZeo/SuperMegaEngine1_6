/// @description insideRegion(left, top, right, bottom)
function insideRegion(argument0, argument1, argument2, argument3) {
	//Returns true if the object is inside the region, and false if not

	if sprite_get_xcenter() >= argument0 && sprite_get_xcenter() < argument2
	&& sprite_get_ycenter() >= argument1 && sprite_get_ycenter() < argument3
	    return true;
	else
	    return false;



}
