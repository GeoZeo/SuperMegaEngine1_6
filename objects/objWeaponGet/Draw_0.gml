draw_sprite_ext(megaSpr, megaImg, megaX, megaY, 1, 1, 0, c_white, 1);

draw_set_font(global.MM3font);

var oldCol, oldAlpha;
oldCol = draw_get_color();
oldAlpha = draw_get_alpha();
draw_set_color(c_white);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var src_col1 = global.src_col1;
var src_col2 = global.src_col2;
var src_col3 = global.src_col3;
var primaryCol = src_col1;
var primaryColDark = src_col2;
var secondaryCol  = src_col3;

var textX, textY;
textX = round(__view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) / 3));
textY = round(__view_get( e__VW.YView, 0 ) + (__view_get( e__VW.HView, 0 ) * 0.4));

if phase >= 6 {
    //Draw "You got"
    draw_set_alpha(text1Alpha);
    draw_text(textX, textY, string_hash_to_newline("YOU GOT"));
    draw_set_alpha(1);
}

if global.weaponID > -1 && doAgain {
    primaryCol = global.weaponID.primaryCol; //The primary color for the giant MM in the weapon get screen
    primaryColDark = merge_color(primaryCol, c_black, 0.3); //The shading on the primary color
    secondaryCol = global.weaponID.secondaryCol; //The secondary color for the giant MM in the weapon get screen
}

if phase >= 7 {
    //Draw the weapon name
    draw_set_alpha(text2Alpha);
    if global.weaponID > -1 {
        draw_text(textX, textY+25, string_hash_to_newline(global.weaponID.name));
    }
	draw_set_alpha(text3Alpha);
	if global.utilityID > -1 && doAgain {
		draw_text(textX, textY+50, string_hash_to_newline("AND " + global.utilityID.name));
	}
	draw_set_alpha(1);
	if doAgain drawSpriteColorSwap(megaSpr, megaImg, megaX, megaY, src_col1, src_col2, src_col3, primaryCol, primaryColDark, secondaryCol);
}

if global.weaponID > -1 {
    primaryCol = global.weaponID.primaryCol; //The primary color for the giant MM in the weapon get screen
    primaryColDark = merge_color(primaryCol, c_black, 0.3); //The shading on the primary color
    secondaryCol = global.weaponID.secondaryCol; //The secondary color for the giant MM in the weapon get screen
}
if global.utilityID > -1 && doAgain {
    primaryCol = global.utilityID.primaryCol; //The primary color for the giant MM in the weapon get screen
    primaryColDark = merge_color(primaryCol, c_black, 0.3); //The shading on the primary color
    secondaryCol = global.utilityID.secondaryCol; //The secondary color for the giant MM in the weapon get screen
}

if phase == 8 {
    //Flickering
    if timer mod 2 == 0 {
        drawSpriteColorSwap(megaSpr, megaImg, megaX, megaY, src_col1, src_col2, src_col3, primaryCol, primaryColDark, secondaryCol);
    }
}
else if phase == 9 {
    drawSpriteColorSwap(megaSpr, megaImg, megaX, megaY, src_col1, src_col2, src_col3, primaryCol, primaryColDark, secondaryCol);
}


draw_set_color(oldCol);
draw_set_color(oldAlpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if cfgWeaponPreview and global.weaponID > -1 {
    with global.weaponID event_user(7);
}
if cfgWeaponPreview and global.utilityID > -1 {
    with global.utilityID event_user(7);
}

