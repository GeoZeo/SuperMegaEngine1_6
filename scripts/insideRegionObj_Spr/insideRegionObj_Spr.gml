/// @description  insideRegionObj_Spr(obj, left, top, right, bottom)
function insideRegionObj_Spr(argument0, argument1, argument2, argument3, argument4) {
	//Returns true if the object's sprite intersects with the region in any capacity, and false if not

	var obj = argument0;

	if obj.bbox_right-1 >= argument1 && obj.bbox_left < argument3
	&& obj.bbox_bottom-1 >= argument2 && obj.bbox_top < argument4
	    return true;
	else
	    return false;



}
