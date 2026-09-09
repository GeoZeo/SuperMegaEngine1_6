/// @description  insideRegionObj(obj, left, top, right, bottom)
function insideRegionObj(argument0, argument1, argument2, argument3, argument4) {
	//Returns true if the object is inside the region, and false if not

	var obj = argument0;

	if sprite_get_xcenter_object(obj) >= argument1 && sprite_get_xcenter_object(obj) < argument3
	&& sprite_get_ycenter_object(obj) >= argument2 && sprite_get_ycenter_object(obj) < argument4
	    return true;
	else
	    return false;



}
