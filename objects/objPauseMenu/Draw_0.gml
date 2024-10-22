var oldCol, oldAlp;
oldCol = draw_get_color();
oldAlp = draw_get_alpha();

var weapons_height = 139;
var icon_size = 16;
var spacing = max(0, floor((weapons_height - ceil(global.totalWeapons / 2) * icon_size) / (ceil(global.totalWeapons / 2) + 1)));
var iniY = 17 + spacing;

//Menu
if (phase >= 1 && phase <= 3) || phase == 5 || phase == 6
{
	//draw_set_font(global.font);
    draw_set_font(global.MM3font);
    
    //BG
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_sprite(sprPauseMenuNew, 0, global.viewX, global.viewY);
    

    //Life
    var xx, yy, bgCol, i;
    bgCol = make_color_rgb(5, 5, 5);
    xx = global.viewX+200;
    yy = global.viewY+180;
    /*draw_sprite_ext(sprLife, 0, xx, yy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(sprLifePrimary, 0, xx, yy, 1, 1, 0, global.primaryCol, 1);
    draw_sprite_ext(sprLifeSecondary, 0, xx, yy, 1, 1, 0, global.secondaryCol, 1);
    draw_sprite_ext(sprLifeOutline, 0, xx, yy, 1, 1, 0, bgCol, 1);*/
    draw_text(xx + (41-24), yy + (201-205), string_hash_to_newline("0" + string(global._lives)));
    
    //Screws
    if global.enableScrews {
        xx = global.viewX+192;
        yy = global.viewY+199;
        draw_sprite(sprScrewBig, 0, xx - 2, yy);
        draw_text(xx + (41-24), yy + (201-194), string_hash_to_newline(string_replace_all(string_format(global.screws, 3, 0), " ", "0")));
    }
    
    //Player
    xx = global.viewX+194;
    yy = global.viewY+172;

    drawSpriteColorSwap(playerSprite, 0, xx, yy, global.charPrimaryColor, global.charSecondaryColor, make_colour_rgb(1.0, 1.0, 1.0),global.primaryCol,global.secondaryCol, global.outlineCol);
            
    //Weapons
    currX = 32;
    currY = iniY;
    for(i = 0; i < global.totalWeapons; i++) {
        if i >= global.char_weapons_per_col && currX == 32 {
            currX = 144;
            currY = iniY;
        }
        if global.weapons[i].unlocked {
            //Icon
            if option == i {
                //draw_sprite_ext(sprWeaponIcons, global.weapons[i].ID, __view_get( e__VW.XView, 0 )+currX, __view_get( e__VW.YView, 0 )+currY, 1, 1, 0, c_white, 1);
				draw_sprite_ext(sprWeaponIcons, global.weapons[i].ID, global.viewX+currX, global.viewY+currY, 1, 1, 0, c_white, 1);
                /*shader_set(shBlueish);
                draw_sprite_ext(sprWeaponIconsColor, global.weaponSlot[i], view_xview[0]+currX, view_yview[0]+currY, 1, 1, 0, c_white, 1);
                shader_reset();*/
                
                // If using something like an W-Tank, draw the arrow as an indicator.
                if primedItemIndex != -1
                    draw_sprite_ext(sprPassArrow, (arrowTimer % 30 >= 15) % 2, global.viewX+currX-6, global.viewY+currY+6, 1, 1, 0, c_white, 1);
            }
            else {
				draw_sprite_ext(sprWeaponIconsGray, global.weapons[i].ID, global.viewX+currX, global.viewY+currY, 1, 1, 0, c_white, 1);
                //shader_set(shGrayscale);
                //draw_sprite_ext(sprWeaponIconsColor, global.weapons[i].ID, __view_get( e__VW.XView, 0 )+currX, __view_get( e__VW.YView, 0 )+currY, 1, 1, 0, c_white, 1);
                //shader_reset();
            }    
            //Ammo bar
            var ammo;
            if i == 0 {
				var j = 0;
				while (j+1) * 28 < global._health j++;
				ammo = global._health - (28 * j);
			}
            else {
				var j = 0;
				while (j+1) * 28 < ceil(global.weapons[i].ammo) j++;
				ammo = ceil(global.weapons[i].ammo) - (28 * j);
			}
                
            if option == i
                draw_sprite_ext(sprPauseMenuBarNew, ammo, global.viewX+currX+32, global.viewY+currY+8, 1, 1, 0, c_white, 1);
            else {
				draw_sprite_ext(sprPauseMenuBarGray, ammo, global.viewX+currX+32, global.viewY+currY+8, 1, 1, 0, c_white, 1);
                //draw_sprite_ext(sprPauseMenuBarGray, ammo, view_xview[0]+currX+32, view_yview[0]+currY+8, 1, 1, 0, c_white, 1);
                //shader_set(shGrayscale);
                //draw_sprite_ext(sprPauseMenuBar, ammo, __view_get( e__VW.XView, 0 )+currX+32, __view_get( e__VW.YView, 0 )+currY+8, 1, 1, 0, c_white, 1);
                //shader_reset();
            }                
            //Name
			//draw_set_font(global.font);
            draw_set_font(global.MM3font);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            
            if option == i
            {
                draw_set_color(make_color_rgb(255, 217, 162)); //Light yellow-ish
                draw_text(global.viewX+currX+16+10, global.viewY+currY+1, string_hash_to_newline(global.weapons[i].abbrev));
                draw_set_color(c_white);
            }
            else
                draw_text(global.viewX+currX+16+10, global.viewY+currY+1, string_hash_to_newline(global.weapons[i].abbrev));
        }
        else if prtPlateEquip.weapon == global.weapons[i].object_index {
            var tempX = currX;
            for (var p = 0; object_exists(p); p++) {
                if object_get_parent(p) == prtPlateEquip {
                    if p.count > 0 {
                        col = c_white;
                    }
                    else {
                        col = c_gray;
                    }
                    draw_sprite_ext(p.sprite_index, 0, global.viewX+tempX, global.viewY+currY, 1, 1, 0, col, 1); 
                    tempX += p.sprite_width + 1;
                }
            }
        }
        currY += icon_size + spacing;
    }
  
    //Life bar
    //draw_sprite_ext(sprPauseMenuBarGray, global._health, view_xview[0]+182, view_yview[0]+192, 1, 1, 0, c_white, 1);
    //shader_set(shGrayscale);
	var _health;
	var j = 0;
	while (j+1) * 28 < global._health j++;
	_health = global._health - (28 * j);
    draw_sprite_ext(sprPauseMenuLifeBar, _health, global.viewX+182, global.viewY+192, 1, 1, 0, c_white, 1);
    //shader_reset();
  
    //Items
    currX = 16;
    currY = 164;
    for (var i = 0; i < array_length_1d(global.items); i++) {
        if !global.items[i].showPause or (global.items[i].count == 0 and !global.items[i].showZero) {
            continue;
        }
        if !global.items[i].usable && currY == 164 {
            currX = 16;
            currY = 191;
        }
        if option == global.totalWeapons + i || !global.items[i].usable || i == primedItemIndex {
            draw_sprite(global.items[i].sprite_index, 0, global.viewX+currX, global.viewY+currY);
        }
        else {
           draw_sprite(global.items[i].sprite_index, 1, global.viewX+currX, global.viewY+currY);
		   //if sprite_exists(asset_get_index(sprite_get_name(global.items[i].sprite_index) + "Gray")) {
			//   draw_sprite(asset_get_index(sprite_get_name(global.items[i].sprite_index) + "Gray"), 0, global.viewX+currX, global.viewY+currY);
		   //}
		   //else {
	       //    shader_set(shGrayscale);
	       //    draw_sprite(global.items[i].sprite_index, 0, global.viewX+currX, global.viewY+currY);
	       //    shader_reset();
		   //}
        }
        
        if (global.items[i].showCount) {
            draw_text(global.viewX+currX, global.viewY+currY+17, string_hash_to_newline("0" + string(global.items[i].count)));
        }
        currX += 21;
    }
    
}


//Black rectangle
draw_set_color(c_black);
draw_set_alpha(blackAlpha);
draw_rectangle(global.viewX, global.viewY, global.viewX+global.viewWidth, global.viewY+global.viewHeight, false);


draw_set_color(oldCol);
draw_set_alpha(oldAlp);

/* */
/*  */
