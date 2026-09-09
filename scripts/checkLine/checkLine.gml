function checkLine(argument0, argument1, argument2, argument3, argument4) {
	//checkLine(list,x1,y1,x2,y2)
	assert(argument_count == 5, "checkLine has 5 input arguments.");
	assert(is_real(argument1), "checkLine argument 1 must be a real number.");
	assert(is_real(argument2), "checkLine argument 2 must be a real number.");
	assert(is_real(argument3), "checkLine argument 3 must be a real number.");
	assert(is_real(argument4), "checkLine argument 4 must be a real number.");

	var x1 = argument1;
	var y1 = argument2;
	var x2 = argument3;
	var y2 = argument4;

	var lines_size = ds_list_size(argument0);
	
	if lines_size == 0 return false;
	
	for (var i = 0; i < lines_size; i++) {
		var current_lines = ds_list_find_value(argument0, i);
		if is_array(current_lines) {
			var line = current_lines;
			if (((line[0] == x1 and line[2] == x2) or (line[0] == x2 and line[2] == x1)) &&
				((line[1] == y1 and line[3] == y2) or (line[1] == y2 and line[3] == y1))) {
					return true;
			}
		}
		else {
			var size = ds_list_size(current_lines);
			for (var j = 0; j < size; j++) {
				var line = ds_list_find_value(current_lines, j);
				if (((line[0] == x1 and line[2] == x2) or (line[0] == x2 and line[2] == x1)) &&
					((line[1] == y1 and line[3] == y2) or (line[1] == y2 and line[3] == y1))) {
						return true;
				}
			}
		}
	}
	
	return false;



}
