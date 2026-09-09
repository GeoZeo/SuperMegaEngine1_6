/// @description  insideRegionAny(obj, left, top, right, bottom)
function insideRegionAny(argument0, argument1, argument2, argument3, argument4) {
	//Returns an object if any object of this type is inside the region, and -1 otherwise

	var obj = argument0;

	with obj {
	    if sprite_get_xcenter() >= argument1 && sprite_get_xcenter() < argument3
	    && sprite_get_ycenter() >= argument2 && sprite_get_ycenter() < argument4
	        return self;
	}
	return -1;



}
