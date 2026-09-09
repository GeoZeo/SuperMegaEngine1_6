/// @description  draw_text_to_index(x, y, string, chr_index, round)
function draw_text_to_index(argument0, argument1, argument2, argument3, argument4) {
	
	//
	//  Draws text up to a given index.
	//  
	//
	//      x			x-position of the text, real
	//      y			y-position of the text, real
	//      string		the string to draw, string
	//      chr_index	the index at which to stop drawing the text (set to below zero for infinite), real
	//      round		how we're rounding the index (0 = floor, 1 = round, 2 = ceil), real (clamped between 0 and 2)
	
	var _x = argument0;
	var _y = argument1;
	var _string = argument2;
	var _chr_i = argument3;
	var _round = argument4;
	
	if floor(_round) <= 0 {
		_chr_i = floor(argument3);
	}
	else if floor(_round) == 1 {
		_chr_i = round(argument3);
	}
	else {
		_chr_i = ceil(argument3);
	}
	
	var _output = "";
	
	if _chr_i >= 0 {
		for (var i = 1; i <= _chr_i && i <= string_length(_string); i++) {
			_output += string_char_at(_string, i);
		}
	}
	else {
		_output = _string;
	}
	
	draw_text(_x, _y, _output);
	
}