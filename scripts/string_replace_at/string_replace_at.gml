/// @description  string_replace_at(str, index, substr)
function string_replace_at(argument0, argument1, argument2) {
	var str = argument0;
	var index = argument1;
	var substr = argument2;
	var len = string_length(string(substr));
	var newstr = "";

	newstr = string_delete(str, index, len);
	newstr = string_insert(string(substr), newstr, index);

	return newstr;



}
