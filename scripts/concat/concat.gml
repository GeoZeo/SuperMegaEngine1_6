/// @description  concat(variables or strings)
function concat() {

	var output_string = "";

	for (var i = 0; i < argument_count; i++) {
	    output_string += string(argument[i]) + " ";
	}

	return output_string;



}
