/// @description  draw_text_to_index_ext(x, y, string, sep, w, plb, chr_index, round)
function draw_text_to_index_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	
	//
	//  Draws text up to a given index.
	//  Can be used in more or less the same manner as draw_text_ext
	//
	//      x			x-position of the text, real
	//      y			y-position of the text, real
	//      string		the string to draw, string
	//		sep			number of pixels between lines of text, real
	//		w			maximum line width in pixels, real
	//		plb			whether or not preemptive line breaks when drawing words that go past the width limit are turned on, bool
	//      chr_index	the index at which to stop drawing the text (set to below zero for infinite), integer
	//      round		how we're rounding the index (0 = floor, 1 = round, 2 = ceil), real (clamped between 0 and 2)
	
	var _x = argument0;
	var _y = argument1;
	var _string = argument2;
	var _sep = argument3;
	var _w = argument4;
	var _plb = argument5;
	var _chr_i = argument6;
	var _round = argument7;
	
	if floor(_round) <= 0 {
		_chr_i = floor(argument6);
	}
	else if floor(_round) == 1 {
		_chr_i = round(argument6);
	}
	else {
		_chr_i = ceil(argument6);
	}
	
	var _output = "";
	
	if _chr_i >= 0 {
		
		var _new_string = "";
		
		for (var i = 1; i <= string_length(_string); i++) {
			_new_string += string_char_at(_string, i);
			if _plb && string_char_at(_string, i) == " " {
				var _old_string = _new_string;
				var _count = 0;
				for (var j = i + 1; string_char_at(_string, j) != " " && j <= string_length(_string); j++) {
					_old_string += string_char_at(_string, j);
					_count++;
				}
				if string_width(_old_string) > _w {
					_new_string = string_replace_at(_new_string, i, "\n");
				}
			}
		}
	
		for (var i = 1; i <= _chr_i && i <= string_length(_new_string); i++) {
			_output += string_char_at(_new_string, i);
		}
	}
	else {
		_output = _string;
	}
	
	draw_text_ext(_x, _y, _output, _sep, _w);
	
}