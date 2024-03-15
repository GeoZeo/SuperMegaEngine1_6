/// @description  assert(condition, [msg])
function assert(argument0, argument1) {
	if cfgDebug || debug_mode {
	    var condition = argument0;
	    if !condition {
	        var msg = "Assertion Failed on " + object_get_name(self) + ".";
	        if argument_count > 1 {
	            msg += " " + argument1;
	        }
        
	        show_error(msg, true);
	    }
	}



}
