function draw_password(argument0) {
	//draw_password(password)
	var password = argument0;
	var posx = 23;
	var posy = 19;
	var size = 16;
	var offset = 3;
	for (i = 0; i < 64; i++) {
	    var value = string_char_at(password, i + 1);
	    var row = i div 8;
	    var col = i mod 8;
		if !(!cfgTwoPasswordColours && !cfgUseRedPassDotsNotBlue) {
		    switch(value) {
		        case "1": draw_sprite(reddot, 0, posx + col * size + offset, posy + row * size + offset); break;
		        case "2": draw_sprite(bluedot, 0, posx + col * size + offset, posy+ row * size + offset); break;
		    }
		}
		else {
			//If we're only using one dot colour for the password system
			//and it's been set to blue in the macros script (via cfgUseRedPassDotsNotBlue being set to false)
			if value == "1" draw_sprite(bluedot, 0, posx + col * size + offset, posy + row * size + offset);
		}
	}



}
