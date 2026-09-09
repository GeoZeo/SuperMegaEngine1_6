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

if array_length_1d(npc.welcomeDialogues) == 0 npc.welcomePhase = false;
if array_length_1d(npc.thankingDialogues) == 0 npc.thankingPhase = false;
if array_length_1d(npc.cancelDialogues) == 0 npc.cancelPhase = false;
if array_length_1d(npc.notEnoughDialogues) == 0 npc.notEnoughPhase = false;
if array_length_1d(npc.noStockDialogues) == 0 npc.noStockPhase = false;
if array_length_1d(npc.tooManyDialogues) == 0 npc.tooManyPhase = false;
if array_length_1d(npc.goodbyeDialogues) == 0 npc.goodbyePhase = false;

var in_dialogue = 
	npc.welcomePhase or npc.surePhase or
	npc.thankingPhase or npc.notEnoughPhase or
	npc.noStockPhase or npc.tooManyPhase or
	npc.goodbyePhase or npc.cancelPhase
;

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
        //shader_set(shGrayscale);
        //draw_sprite(global.items[i].sprite_index, 0, currX + 3, currY+1);
        //shader_reset();
		draw_sprite(global.items[i].sprite_index, 1, currX + 3, currY+1);
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

if showCursor && (!hideCursorOnFinish or (!npc.goodbyePhase and !isFinished)) {
	draw_sprite_ext(sprShopCursorTopLeft, cursorSprite, currX, currY, 1, 1, 0, c_white, 1);
	draw_sprite_ext(sprShopCursorTopRight, cursorSprite, currX+round(24*sX), currY, 1, 1, 0, c_white, 1);
	draw_sprite_ext(sprShopCursorBottomLeft, cursorSprite, currX, currY+round(24*sY), 1, 1, 0, c_white, 1);
	draw_sprite_ext(sprShopCursorBottomRight, cursorSprite, currX+round(24*sX), currY+round(24*sY), 1, 1, 0, c_white, 1);
}


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
var _npcs_finished = [];
var _finish = true;
for (var i = 0; i < array_length_1d(npc.names); i++) {
	
	_npcs_finished[i] = false;
	
	var _img = iif(npc.currentSpriteSpeeds[i] >= 0, floor(npc.imageIndices[i]), ceil(npc.imageIndices[i]));
	
	draw_sprite_ext(npc.currentSprites[i], _img, npc.x_positions[i], npc.y_positions[i], npc.x_scales[i], npc.y_scales[i], 0, c_white, 1);
	
	if npc.currentSprites[i] != npc.enterSprites[i] || npc.enterSprites[i] == sprNothing || !instance_exists(objFadeIn)
		npc.imageIndices[i] += npc.currentSpriteSpeeds[i];
	
	if npc.currentSpriteSpeeds[i] >= 0 && npc.imageIndices[i] >= sprite_get_number(npc.currentSprites[i])
	{
		npc.enterBools[i] = false;
		npc.imageIndices[i] = 0;
	}
	else if npc.currentSpriteSpeeds[i] < 0 && npc.imageIndices[i] <= 0
	{
		if npc.imageIndices[i] <= -1 && ((!(npc.goodbyePhase or isFinished) and npc.currentSprites[i] != npc.enterSprites[i]) || npc.enterSprites[i] == sprNothing) {
			npc.imageIndices[i] = sprite_get_number(npc.currentSpriteSpeeds[i]) - 1;
		}
		else {
			npc.imageIndices[i] = 0;
			_npcs_finished[i] = true;
		}
	}
	
	if npc.enterSprites[i] == sprNothing
	{
		_npcs_finished[i] = true;
	}
}
for (var i = 0; i < array_length_1d(_npcs_finished); i++)
{
	if !_npcs_finished[i] { _finish = false; break; }
}
//draw_sprite(npc, npcImg, 40, 127);
draw_sprite_ext(global.spriteShop, megaImg, global.shopX, global.shopY, global.shopXScale, global.shopYScale, 0, c_white, 1);

if !instance_exists(objFadeIn) && !instance_exists(objFadeout) && (option < total_items or in_dialogue or npc.idleDialogue != -1) {
	
	if npc.welcomePhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.welcomeDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
	}
	else if npc.surePhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.sureDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
		
		if !scrolling && dialogue_index >= array_length_1d(npc.sureDialogues) - 1 {	
			draw_text(32, 208, string_hash_to_newline("YES"));
			draw_text(96, 208, string_hash_to_newline("NO"));
		
			draw_sprite(sprPassArrow, 0, 22 + (!isSure * 64), 210);
		}
	}
	else if npc.thankingPhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.thankingDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
	}
	else if npc.cancelPhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.cancelDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
	}
	else if npc.notEnoughPhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.notEnoughDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
	}
	else if npc.noStockPhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.noStockDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
	}
	else if npc.tooManyPhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.tooManyDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
	}
	else if npc.goodbyePhase {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.goodbyeDialogues[dialogue_index]), 8, 240, true, text_character_index, 0 );
	}
	else if npc.idleDialogue != -1 && !showInfo {
		draw_text_to_index_ext(8, 184, string_hash_to_newline(npc.idleDialogue), 8, 240, true, text_character_index, 0 );
		
		if !scrolling {
			if global.GP > -1
				draw_text_ext(8, 208, string_hash_to_newline("INFO: " + string_upper(button_to_string(global.selectButton))), 8, 240);
			else
				draw_text_ext(8, 208, string_hash_to_newline("INFO: " + string_upper(key_to_string(global.selectKey))), 8, 240);
		}
	}
	else {
		if option < total_items {
		    //Item Name
		    draw_text(8, 184, string_hash_to_newline(string_upper(global.items[item_index].eqName) + ": 0" + string(global.items[item_index].count) + " / MAX: 0" + string(global.items[item_index].maxUnits)) );
    
		    //Item Description
		    draw_text_ext(8, 200, string_hash_to_newline(string_upper(global.items[item_index].description)), 8, 240);
		}
		else {
			//Exit
		    draw_text(8, 184, string_hash_to_newline(string_upper("LEAVE THE SHOP.")) );
		}
	}
	
	if !scrolling && !isFinished &&
	((showInfo and npc.idleDialogue != -1) or
	(in_dialogue && !(npc.surePhase and dialogue_index >= array_length_1d(npc.sureDialogues) - 1))) {
		draw_sprite(sprAchievementArrowDown, (arrowTimer % 30 >= 15) % 2, 251 - (16 * 8), 216);
	}
}

if !_finish exit;

if isFinished && !instance_exists(objFadeout) && !instance_exists(objFadeIn)
{
	var ID = instance_create(0, 0, objFadeout);
	ID.type = "room";
	ID.myRoom = rmStageSelect;
}

