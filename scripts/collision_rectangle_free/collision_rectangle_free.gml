/// @description collision_rectangle_free -
/// This function uses the first four arguments (x1, y1, x2, y2) to define an area within the room,
/// and then checks to see if any object instance that is flagged as solid in your game is in
/// collision with that area.
/// @param x1    The x coordinate of the left side of the rectangle to check.
/// @param y1    The y coordinate of the top side of the rectangle to check.
/// @param x2    The x coordinate of the right side of the rectangle to check.
/// @param y2    The y coordinate of the bottom side of the rectangle to check.
/// @param prec  Whether the check is based on precise collisions (true, which is slower) or its
/// bounding box in general (false, faster).
/// @param notme Whether the calling instance, if relevant, should be excluded (true) or not (false).
/// @param ordered Whether the DS list of colliding instance IDs should be ordered by distance (true)
/// or not (false).
function collision_rectangle_free(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	
	var _x1 = argument0;
	var _y1 = argument1;
	var _x2 = argument2;
	var _y2 = argument3;
	
	var _prec = argument4;
	var _notme = argument5;
	var _ordered = argument6;
	
	var _list = ds_list_create();
	var _num = collision_rectangle_list(_x1, _y1, _x2, _y2, all, _prec, _notme, _list, _ordered);
	
	if (_num <= 0)
	{
		return true;
	}
	else
	{
		for (var i = 0; i < _num; i++)
		{
			if _list[| i].solid
			{
				return false;
			}
		}
		return true;
	}
}