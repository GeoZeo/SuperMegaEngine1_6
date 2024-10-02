//Items
var total_items_ = array_length_1d(global.items);
var total_items = 0;
for (var i = 0; i < total_items_; i++) {
    if global.items[i].buyable {
        total_items++;
    }
}
var items_per_row = ceil(total_items / 2);
var avail_width = 206;
var item_size = 24;
var spacing = ceil((avail_width - (item_size * items_per_row)) / (items_per_row + 1));
var spacingY = 30;
var iniX = 25 + spacing;
var iniY = 20;

currX = iniX;
currY = iniY;
total = 0;
item_index = -1;
for (var i = 0; i < total_items_; i++) {
    if !global.items[i].buyable {
        continue;
    }
    if option == total {
        item_index = i;
    }
    total++;
    if total == items_per_row + 1 {
        currX = iniX;
        currY = iniY + spacingY;
    }
    if global.screws >= global.items[i].price && global.items[i].count < global.items[i].maxUnits {
        draw_sprite(global.items[i].sprite_index, 0, currX + 3, currY+1);
    }
    else {
        shader_set(shGrayscale);
        draw_sprite(global.items[i].sprite_index, 0, currX + 3, currY+1);
        shader_reset();
    }
    draw_text(currX-1, currY+18, string_hash_to_newline(string_replace_all(string_format(global.items[i].price, 3, 0), " ", "0")));
    currX += spacing + item_size;
}

//Cursor
sX = 1;
sY = 1;
if option < items_per_row { //First Row
    currX = option * (item_size + spacing) + iniX - 3;
    currY = iniY - 1;
}
else if option < total_items {   //Second Row
    currX = (option - items_per_row) * (item_size + spacing) + iniX - 3;
    currY = iniY + spacingY - 1;
}
else {  //EXIT
    currX = 176 - 4;
    currY = 96 - 3;
    sX = 1.75;
    sY = 0.45;    
}
draw_sprite_ext(sprShopCursorTopLeft, cursorSprite, currX, currY, 1, 1, 0, c_white, 1);
draw_sprite_ext(sprShopCursorTopRight, cursorSprite, currX+round(24*sX), currY, 1, 1, 0, c_white, 1);
draw_sprite_ext(sprShopCursorBottomLeft, cursorSprite, currX, currY+round(24*sY), 1, 1, 0, c_white, 1);
draw_sprite_ext(sprShopCursorBottomRight, cursorSprite, currX+round(24*sX), currY+round(24*sY), 1, 1, 0, c_white, 1);


//Screws
draw_sprite(sprScrewBig, 0, 33, 99);
draw_text(54, 105, string_hash_to_newline(string_replace_all(string_format(screws, 3, 0), " ", "0")));

//Exit
//draw_rectangle(175, 95, 214, 104, c_black);
//draw_set_color(c_black);
//draw_text(180, 96, string_hash_to_newline("EXIT"));
//draw_set_color(c_white);
draw_sprite(sprShopExit, 0, 176, 96);


//Sprites
draw_sprite(npc, npcImg, 40, 127);
draw_sprite_ext(global.spriteStand, megaImg, 198, 145, -1, 1, 0, c_white, 1);

if option < total_items {
	if !surePhase {
	    //Item Name
	    draw_text(8, 182, string_hash_to_newline(string_upper(global.items[item_index].eqName) + ": 0" + string(global.items[item_index].count) + " / MAX: 0" + string(global.items[item_index].maxUnits)) );
    
	    //Item Description
	    draw_text_ext(8, 198, string_hash_to_newline(string_upper(global.items[item_index].description)), 10, 240);
	}
	else {
		draw_text(8, 182, string_hash_to_newline("BUY ONE " + string_upper(global.items[item_index].eqName) + "?") );
		
		draw_text(32, 198, string_hash_to_newline("YES"));
		draw_text(96, 198, string_hash_to_newline("NO"));
		
		draw_sprite(sprPassArrow, 0, 22 + (!isSure * 64), 200);
	}
}

