/// @description  string_contains(str, substr)
function string_contains(argument0, argument1) {
	//
	//  Returns true if a given string contains a given
	//  substring.
	//
	//      str         string of text, string
	//      substr		the substring to look for, string
	{
	    var str = argument0;
	    var substr = argument1;
	    return string_pos(substr, str) >= 0 && string_pos(substr, str) <= (string_length(str) - 1)
	}



}
