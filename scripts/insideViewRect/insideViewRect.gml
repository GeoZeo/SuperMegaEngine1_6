/// @description Returns true if the given rectangle is inside the view, and false if not. NOTE: This script only works for view 0.
/// @param x1	The left coordinate to check, real
/// @param y1	The top coordinate to check, real
/// @param x2	The right coordinate to check, real
/// @param y2	The bottom coordinate to check, real
/// @param tl_incl	   Whether or not to still return true if the edge of the rectangle is parallel with the top and/or left edge of the view, bool
/// @param br_incl	   Whether or not to still return true if the edge of the rectangle is parallel with the bottom and/or right edge of the view, bool
function insideViewRect(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _x1 = argument0;
	var _y1 = argument1;
	var _x2 = argument2;
	var _y2 = argument3;
	var _tl_incl = argument4;
	var _br_incl = argument5;
	
	if _tl_incl || _br_incl
	{
		if _tl_incl && !_br_incl
		{
			if _x2 >= global.viewX && _x1 < global.viewX+global.viewWidth
			&& _y2 >= global.viewY && _y1 < global.viewY+global.viewHeight
			    return true;
			else
			    return false;
		}
		else if !_tl_incl && _br_incl
		{
			if _x2 > global.viewX && _x1 <= global.viewX+global.viewWidth
			&& _y2 > global.viewY && _y1 <= global.viewY+global.viewHeight
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
	else
	{
		if _x2 > global.viewX && _x1 < global.viewX+global.viewWidth
		&& _y2 > global.viewY && _y1 < global.viewY+global.viewHeight
		    return true;
		else
		    return false;
	}



}
