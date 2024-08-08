/// @description  is_int(n)
function is_int(argument0) {
	//
	//  Returns whether or not a given number value is a whole number
	//
	//      n      number value to be checked, real or integer
	//
	/// GMLscripts.com/license
	return is_int32(argument0) or is_int64(argument0);
	
	
	
}
