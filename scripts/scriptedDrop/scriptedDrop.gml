/// @description scriptedDrop(x, y, obj, [timer], [xspeed], [yspeed])
/// @param x - instance x-position, real
/// @param y - instance y-position, real
/// @param obj - object to create an instance of, real
/// @param timer - timer to set before instance despawns (set to -1 to have no timer), real
/// @param xspeed - horizontal speed that the instance is spawned with, real
/// @param yspeed - vertical speed that the instance is spawned with, real
function scriptedDrop(argument0, argument1, argument2) {
	//Scripted item spawn
	assert(argument_count >= 3 and argument_count <= 6, "scriptedDrop has 3-6 input arguments.");
	assert(is_real(argument0), "scriptedDrop argument 0 must be a real number.");
	assert(is_real(argument1), "scriptedDrop argument 1 must be a real number.");
	assert(is_real(argument2) && object_is_ancestor(argument2, prtPickup), "scriptedDrop argument 2 must be a child class index of prtPickup.");
	if argument_count >= 4 assert(is_real(argument3), "scriptedDrop argument 3 must be a real number.");
	if argument_count >= 5 assert(is_real(argument4), "scriptedDrop argument 4 must be a real number.");
	if argument_count == 6 assert(is_real(argument5), "scriptedDrop argument 5 must be a real number.");

	var _x = argument0;
	var _y = argument1;
	var _obj = argument2;
	var _timer = -1;
	if argument_count >= 4
	{
		_timer = argument3;
	}
	var _xspeed = 0;
	var _yspeed = 0;
	if argument_count >= 5
	{
		_xspeed = argument4;
	}
	if argument_count == 6
	{
		_yspeed = argument5;
	}
	
	
	var nitem = instance_create(_x, _y, _obj);
	if argument_count >= 4
		nitem.alarm[0] = _timer;
	if argument_count >= 5
		nitem.xspeed = _xspeed;
	if argument_count == 6
		nitem.yspeed = _yspeed;
	
	with nitem
	{
		if !place_free(x+xspeed, y+yspeed)
		{
			xspeed = 0;
			yspeed = 0;
		}
	}



}