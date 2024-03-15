/// @description  escapeWall(): avoids getting stuck into walls
function escapeWall(argument0, argument1, argument2, argument3) {

	var goLeft = argument0;
	var goRight = argument1;
	var goUp = argument2;
	var goDown = argument3;

	amount = 1;
	while !place_free(x, y) {
	    if place_free(x-amount, y) && argument0 == true {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the left");
	        x -= amount;
	    }
	    else if place_free(x+amount, y) && argument1 == true {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel to the right");
	        x += amount;
	    }
	    else if place_free(x, y-amount) && argument2 == true {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel up");
	        y -= amount;
	    }
	    else if place_free(x, y+amount) && argument3 == true {
	        show_debug_message(object_get_name(object_index) + " Stuck: Move "+string(amount)+" pixel down");
	        y += amount;
	    }
	    else {
	        amount++;
	    }
	}


	if (cfgDebug || debug_mode) && position_meeting(x, y+5, objSolid) {
	    //show_error("Stuck!", false);
	    show_debug_message("Stuck!");
	}

	if (cfgDebug || debug_mode) && place_meeting(x, y, objSolid) {
	    //show_error("Stuck!", false);
	    show_debug_message("Stuck!?");
	}



}
