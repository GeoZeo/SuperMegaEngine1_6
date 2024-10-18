var xx, yy1, yy2, yy3;
xx = 78;
yy1 = 174;
yy2 = yy1 + 16;
yy3 = yy2 + 16;

if !canSelectOption draw_sprite(sprPassText, 1, xx + 10, yy1 - 7);

if canSelectOption {
    if option == 0
        draw_sprite(sprPassArrow, (timer % 30 >= 15) % 2, xx, (yy1 - 1) + (8 * (global.passContinueRoom == cfgInitialStage && !(global.initialStageClear and cfgInitialStageReplayable))) + (8 * !cfgEnableSaving));
    else if option == 1
        draw_sprite(sprPassArrow, (timer % 30 >= 15) % 2, xx, (yy2 - 1) + (8 * (global.passContinueRoom == cfgInitialStage && !(global.initialStageClear and cfgInitialStageReplayable))) + (8 * !cfgEnableSaving));
    else
        draw_sprite(sprPassArrow, (timer % 30 >= 15) % 2, xx, yy3 - 1);
	
	draw_set_colour(c_white);
    draw_set_font(global.MM3font);
    draw_set_halign(fa_left);
	if global.passContinueRoom != cfgInitialStage || (global.initialStageClear and cfgInitialStageReplayable) {
		draw_text(xx + 10, (yy1 - 3) + (8 * !cfgEnableSaving), string_hash_to_newline("STAGE SELECT"));
		draw_text(xx + 10, (yy2 - 3) + (8 * !cfgEnableSaving), string_hash_to_newline("CONTINUE"));
	}
	else {
		if !global.initialStageClear {
			draw_text(xx + 10, (yy1 - 3) + 8 + (8 * !cfgEnableSaving), string_hash_to_newline("CONTINUE"));
		}
		else {
			draw_text(xx + 10, (yy1 - 3) + 8 + (8 * !cfgEnableSaving), string_hash_to_newline("STAGE SELECT"));
		}
	}
    if cfgEnableSaving {
		var yy_save;
		if global.passContinueRoom == cfgInitialStage && !(global.initialStageClear and cfgInitialStageReplayable) {
			yy_save = (yy2 - 3) + 8;
		}
		else {
			yy_save = yy3 - 3;
		}
		draw_text(xx + 10, yy_save, string_hash_to_newline("SAVE GAME"));
    }
}


if cfgEnablePasswords {
    draw_password(pass);
}

