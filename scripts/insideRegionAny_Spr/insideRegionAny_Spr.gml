/// @description  insideRegionAny_Spr(obj, left, top, right, bottom)
function insideRegionAny_Spr(argument0, argument1, argument2, argument3, argument4) {
	//Returns an object if any object of this type's sprite intersects with the region in any capacity, and -1 otherwise

	var obj = argument0;

	with obj {
	    if bbox_right-1 >= argument1 && bbox_left < argument3
	    && bbox_bottom-1 >= argument2 && bbox_top < argument4
	        return self;
	}
	return -1;



}
