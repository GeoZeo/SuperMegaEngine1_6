/// @description Returns true if the given point is inside the region, and false if not.
/// @param x	The x-coordinate to check, real
/// @param y	The y-coordinate to check, real
/// @param left		The left edge of the region, real
/// @param top		The top edge of the region, real
/// @param right	The right edge of the region, real
/// @param bottom	The bottom edge of the region, real
/// @param tl_incl    Whether or not to still return true if the point is on the top and/or left edge of the region, bool
/// @param br_incl    Whether or not to still return true if the point is on the bottom and/or right edge of the region, bool
function insideRegionPoint(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var _x = argument0;
	var _y = argument1;
	var _left = argument2;
	var _top = argument3;
	var _right = argument4;
	var _bottom = argument5;
	var _tl_incl = argument6;
	var _br_incl = argument7;
	
	if _tl_incl || _br_incl
	{
		if _tl_incl && !_br_incl
		{
			if _x >= _left && _x < _right
			&& _y >= _top && _y < _bottom
			    return true;
			else
			    return false;
		}
		else if !_tl_incl && _br_incl
		{
			if _x > _left && _x <= _right
			&& _y > _top && _y <= _bottom
			    return true;
			else
			    return false;
		}
		else
		{
			if _x >= _left && _x <= _right
			&& _y >= _top && _y <= _bottom
			    return true;
			else
			    return false;
		}
	}
	else
	{
		if _x > _left && _x < _right
		&& _y > _top && _y < _bottom
		    return true;
		else
		    return false;
	}



}
