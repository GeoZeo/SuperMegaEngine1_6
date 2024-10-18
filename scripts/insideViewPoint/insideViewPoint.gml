/// @description Returns true if the given point is inside the view, and false if not. NOTE: This script only works for view 0.
/// @param x	The x-coordinate to check, real
/// @param y	The y-coordinate to check, real
/// @param incl	Whether or not to return true if the point is on the edge of the view, bool
function insideViewPoint(argument0, argument1, argument2) {

	var _x = argument0;
	var _y = argument1;
	var _incl = argument2;
	
	if !_incl
	{
		if _x > global.viewX && _x < global.viewX+global.viewWidth
		&& _y > global.viewY && _y < global.viewY+global.viewHeight
		    return true;
		else
		    return false;
	}
	else
	{
		if _x >= global.viewX && _x <= global.viewX+global.viewWidth
		&& _y >= global.viewY && _y <= global.viewY+global.viewHeight
		    return true;
		else
		    return false;
	}



}
