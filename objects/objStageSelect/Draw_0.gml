//Register the X and Y coordinates of all panels
var i;
for(i = 0; i <= 8; i++) {
    switch i {
        case 0: xx[i] = 24; yy[i] = 24; break;
        case 1: xx[i] = 104; yy[i] = 24; break;
        case 2: xx[i] = 184; yy[i] = 24; break;
        case 3: xx[i] = 184; yy[i] = 88; break;
        case 4: xx[i] = 184; yy[i] = 152; break;
        case 5: xx[i] = 104; yy[i] = 152; break;
        case 6: xx[i] = 24; yy[i] = 152; break;
        case 7: xx[i] = 24; yy[i] = 88; break;
        case 8: xx[i] = 104; yy[i] = 88; break;
    }
}


//Draw the selected panel
draw_sprite(sprStageSelectPanel, floor(imgIndex), xx[option], yy[option]);

draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_valign(fa_top);
    
var words, word;

//Draw the boss icons and names
for(i = 0; i < 8; i++) {
    if !global.bossDefeated[i]
        draw_sprite(sprStageSelectIcons, i, xx[i]+8, yy[i]+8);

    //Boss name
    if is_string(global.bossNames[i]) and global.bossNames[i] != "" {
        words = split(global.bossNames[i], " ");
        word = ds_queue_dequeue(words);
        if string_length(word) <= 6 {
            draw_set_halign(fa_left);
            draw_text(xx[i], yy[i] + 48, string_hash_to_newline(word));
        }
        else {
            draw_set_halign(fa_right);        
            draw_text(xx[i] + 48, yy[i] + 48, string_hash_to_newline(word));
        }
        if (ds_queue_size(words) > 0) {
            draw_set_halign(fa_right);
            word = ds_queue_dequeue(words);
            draw_text(xx[i] + 48, yy[i] + 56, string_hash_to_newline(word));
        }
    }
}

ds_queue_destroy(words);

if !drawLogo {
    //Draw MM's head in the middle
    if global.stageSelectFollow {
        idx = option;
    }
    else {
        if oldOption != option or idx > 0 {
            idx += 0.3;
            if (idx >= 4) idx = 0;
        }
    }
    draw_sprite(global.spriteStageSelect, idx, xx[8]+8, yy[8]+8);
}
else {
    //Draw Dr. Wily's logo
	draw_sprite(sprStageSelectIcons, 8, xx[8]+8, yy[8]+8);
	
}

if global.enableScrews && showShop >= 1 {
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    var posx = global.viewWidth / 2;
    var posy = yy[8] + 52;
    if global.GP == -1 {
        draw_text(posx, posy, string_hash_to_newline("SHIFT] SHOP"));
    }
    else {
        draw_text(posx, posy, string_hash_to_newline("SELECT] SHOP"));
    }
}

