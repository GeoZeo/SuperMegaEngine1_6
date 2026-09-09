function makePath(argument0, argument1, argument2, argument3, argument4) {
	//makePath(isUp, isRight, isDown, isLeft, startingIndex)
	assert(argument_count == 5, "makePath has 4 input arguments.");
	assert(is_bool(argument0), "makePath argument 0 must be a boolean.");
	assert(is_bool(argument1), "makePath argument 1 must be a boolean.");
	assert(is_bool(argument2), "makePath argument 2 must be a boolean.");
	assert(is_bool(argument3), "makePath argument 3 must be a boolean.");
	assert(is_real(argument4), "makePath argument 4 must be a real number.");
	
	var up = argument0;
	var right = argument1;
	var down = argument2;
	var left = argument3;
	var _i = argument4;
	
	upPath = -1;
	rightPath = -1;
	downPath = -1;
	leftPath = -1;
	
	if up {
		upPath = instance_create(x, y, objFortressPath);
		upPath.dir = "up";
		upPath.origin = origin;
		upPath.drawerRef = drawerRef;
		array_insert(objFortress.paths, _i, upPath);
		_i++;
	}
	if right {
		rightPath = instance_create(x, y, objFortressPath);
		rightPath.dir = "right";
		rightPath.origin = origin;
		rightPath.drawerRef = drawerRef;
		array_insert(objFortress.paths, _i, rightPath);
		_i++;
	}
	if down {
		downPath = instance_create(x, y, objFortressPath);
		downPath.dir = "down";
		downPath.origin = origin;
		downPath.drawerRef = drawerRef;
		array_insert(objFortress.paths, _i, downPath);
		_i++;
	}
	if left {
		leftPath = instance_create(x, y, objFortressPath);
		leftPath.dir = "left";
		leftPath.origin = origin;
		leftPath.drawerRef = drawerRef;
		array_insert(objFortress.paths, _i, leftPath);
		_i++;
	}
}

