/// @description Returns true if the given rectangle is inside the region, and false if not.
/// @param x1	The left coordinate to check, real
/// @param y1	The top coordinate to check, real
/// @param x2	The right coordinate to check, real
/// @param y2	The bottom coordinate to check, real
/// @param left		The left edge of the region, real
/// @param top		The top edge of the region, real
/// @param right	The right edge of the region, real
/// @param bottom	The bottom edge of the region, real
/// @param tl_incl	   Whether or not to still return true if the edge of the rectangle is parallel with the top and/or left edge of the region, bool
/// @param br_incl	   Whether or not to still return true if the edge of the rectangle is parallel with the bottom and/or right edge of the region, bool
function insideRegionRect(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	var _x1 = argument0;
	var _y1 = argument1;
	var _x2 = argument2;
	var _y2 = argument3;
	var _left = argument4;
	var _top = argument5;
	var _right = argument6;
	var _bottom = argument7;
	var _tl_incl = argument8;
	var _br_incl = argument9;
	
	if _tl_incl || _br_incl
	{
		if _tl_incl && !_br_incl
		{
			if _x2 >= _left && _x1 < _right
			&& _y2 >= _top && _y1 < _bottom
			    return true;
			else
			    return false;
		}
		else if !_tl_incl && _br_incl
		{
			if _x2 > _left && _x1 <= _right
			&& _y2 > _top && _y1 <= _bottom
			    return true;
			else
			    return false;
		}
		else
		{
			if _x2 >= _left && _x1 <= _right
			&& _y2 >= _top && _y1 <= _bottom
			    return true;
			else
			    return false;
		}
	}
	else
	{
		if _x2 > _left && _x1 < _right
		&& _y2 > _top && _y1 < _bottom
		    return true;
		else
		    return false;
	}



}
