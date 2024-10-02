/// @description  drawSave(id, map, selected)
function drawSave(argument0, argument1, argument2) {
	var save_id = argument0;
	var map = argument1;
	var selected = argument2;

	var margin = 30;
	var top = 30;
	var spacing = 2;
	var height = 48;
	var weaponColumns = 2;
	var itemColumns = 2;
	var x1 = margin;
	//var y1 = save_id * (height + spacing) + top;
	var y1 = top + 24;
	var x2 = room_width - margin;
	var y2 = y1 + height;

	draw_set_halign(fa_left);

	if selected {
	    draw_set_colour(c_white);
	}
	else {
	    draw_set_colour(c_gray);
	}

	if map > -1 and selected {

	    if !selected {
	        shader_set(shGrayscale);
	    }
		
		//Draw Player (and life count)
		draw_text(margin + 4, y1 + 60, string_hash_to_newline(string_lpad(string(map[? "lives"]),2,"0")));
	    draw_sprite_ext(global.spriteStand, 0, margin + 12, y1 + 40, 1, 1, 0, c_white, 1);
    
	    //Draw Screws
	    if cfgEnableScrews {
	        draw_text(margin, y1 + 96, string_hash_to_newline(string_lpad(string(map[? "screws"]),3,"0")));
	        draw_sprite_ext(sprScrewBig, 0, margin + 4, y1 + 76, 1, 1, 0, c_white, 1);
	    }
    
	    //Draw Weapons
		for (var i = 0; i < weaponColumns; i++) {
		    for (var j = 0; j+(i*10) < global.totalWeapons && j < 10; j++) {
		        if map[? ("weaponUnlocked" + string(j+(i*10)))] {
		            draw_sprite_ext(sprWeaponIcons, global.weapons[j+(i*10)].ID, room_width - x1 - 20 - (144 - j * 16), y1 + 14 + i * 16, 1, 1, 0, c_white, 1); 
		        }
		    }
		}
    
	    //Draw Items
		for (var i = 0; i < itemColumns; i++) {
		    for (var j = 1; j+(i*7) < array_length_1d(global.items) && j < 7+1; j++) { //Skip item 0 (lives)
		        var count = map[? ("itemCount" + string(j+(i*7)))];
		        //if i == 0 { //Lives
		        //    count = map[? "lives"];
		        //    global.items[i].sprite_index = global.spriteLife;
		        //}
		        if count > 0 {
		            //print(global.items[i].name, object_get_name(global.items[i].object_index), global.items[i].sprite_index);
					if !object_is_ancestor(global.items[j+(i*7)].object_index, prtPlateEquip) {
			            draw_sprite_ext(global.items[j+(i*7)].sprite_index, 0, room_width - x1 - 20 - (144 - (j-1) * 24), y1 + 56 + i * 36, 1, 1, 0, c_white, 1);
			            if global.items[j+(i*7)].showCount {
			                draw_text(room_width - x1 - 20 - (144 - (j-1) * 24), y1 + 76 + i * 36, string_hash_to_newline(string_lpad(string(count),2,"0")));
			            }
					}
		        }
		    }
		}
		
		//Draw Plates
		var plateNum = 0;
		for (var i = 0; i < array_length_1d(global.items); i++) {
			if object_get_parent(global.items[i].object_index) == prtPlateEquip && i != prtPlateEquip {
				if map[? ("itemCount" + string(i))] > 0 {
					draw_sprite_ext(global.items[i].sprite_index, 0, room_width - x1 - 20 - (144 - plateNum * 16), y1 + 128, 1, 1, 0, c_white, 1);
				}
				plateNum++;
			}
		}
    
	    if !selected {
	        shader_reset();
	    }
    
	}
	else if selected {
	    draw_set_halign(fa_center);
	    draw_text(room_width / 2, y1 + 3 + height / 2, string_hash_to_newline("EMPTY"));
	}



}
