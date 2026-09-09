/// @description  move(xs, ys)
function move(argument0, argument1) {

	var xs = argument0;
	var ys = argument1;

	if place_free(x + xs, y) {
	    x += xs * update_rate;
		
		if object_is_ancestor(object_index, prtPlayer) {
			playerBorderCheck(true, false, !(instance_exists(objBeat) and objBeat.carrying and objBeat.transportTimer < objBeat.transportTime));
		}
	}

	if place_free(x, y + ys) {
	    y += ys * update_rate;
	}



}
