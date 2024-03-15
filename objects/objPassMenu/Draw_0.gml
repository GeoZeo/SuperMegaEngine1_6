var xx, yy1, yy2;
var xx = 78;
var yy1 = 174;
var yy2 = yy1 + 16;
var yy3 = yy2 + 16;

draw_sprite(sprPassText, !canSelectOption, xx + 10, yy1 - 7); //1 when game over, 0 otherwise

if canSelectOption {
    if option == 0
        draw_sprite(sprPassArrow, 0, xx, yy1);
    else if option == 1
        draw_sprite(sprPassArrow, 0, xx, yy2);
    else
        draw_sprite(sprPassArrow, 0, xx, yy3);
    if cfgEnableSaving {
        draw_set_colour(c_white);
        draw_set_font(global.MM3font);
        draw_set_halign(fa_left);
        draw_text(xx + 10, yy3 - 3, string_hash_to_newline("SAVE GAME"));
    }
}


if cfgEnablePasswords {
    draw_password(pass);
}

