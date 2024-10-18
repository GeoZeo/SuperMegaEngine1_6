/// @description Returns true if the given rectangle is inside the view, and false if not. NOTE: This script only works for view 0.
/// @param x1	The left coordinate to check, real
/// @param y1	The top coordinate to check, real
/// @param x2	The right coordinate to check, real
/// @param y2	The bottom coordinate to check, real
/// @param incl	Whether or not to return true if the point is on the edge of the view, bool
function insideViewRect(argument0, argument1, argument2, argument3, argument4) {

	var _x1 = argument0;
	var _y1 = argument1;
	var _x2 = argument2;
	var _y2 = argument3;
	var _incl = argument4;
	
	if !_incl
	{
		if _x2 > global.viewX && _x1 < global.viewX+global.viewWidth
		&& _y2 > global.viewY && _y1 < global.viewY+global.viewHeight
		    return true;
		else
		    return false;
	}
	else
	{
		if _x2 >= global.viewX && _x1 <= global.viewX+global.viewWidth
		&& _y2 >= global.viewY && _y1 <= global.viewY+global.viewHeight
		    return true;
		else
		    return false;
	}



}
