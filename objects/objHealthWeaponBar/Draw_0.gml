//Health

// If Mega's max health is set to the classic 28.
if (global._maxHealth == 28)
{
    draw_sprite(sprHealthbarBackground, 0, __view_get( e__VW.XView, 0 )+7+8+5, __view_get( e__VW.YView, 0 )+17);
    
    for(i = 1; i <= global._health; i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, __view_get( e__VW.XView, 0 )+7+8+1+5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(252, 228, 160), 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, __view_get( e__VW.XView, 0 )+7+8+1+5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(248, 248, 248), 1);
    }
}
else
{
    for (i = 1; i <= global._maxHealth; i += 1)
    {
        if (i < global._maxHealth)
            draw_rectangle_color(__view_get( e__VW.XView, 0 )+7+8+5-0.5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), __view_get( e__VW.XView, 0 )+7+8+5+8-0.5, __view_get( e__VW.YView, 0 )+17-3+(sprite_get_height(sprHealthbarBackground)-i*2), c_black, c_black, c_black, c_black, false);
        else
            draw_rectangle_color(__view_get( e__VW.XView, 0 )+7+8+5-0.5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), __view_get( e__VW.XView, 0 )+7+8+5+8-0.5, __view_get( e__VW.YView, 0 )+17-1+(sprite_get_height(sprHealthbarBackground)-i*2), c_black, c_black, c_black, c_black, false);
             
        if (i <= global._health)
        {
           draw_sprite_ext(sprHealthbarPrimary, 0, __view_get( e__VW.XView, 0 )+7+8+1+5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(252, 228, 160), 1);
           draw_sprite_ext(sprHealthbarSecondary, 0, __view_get( e__VW.XView, 0 )+7+8+1+5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(248, 248, 248), 1);
        }
    }
}


//Weapons
if global.weapon != 0 {
    draw_sprite(sprHealthbarBackground, 0, __view_get( e__VW.XView, 0 )+7+5, __view_get( e__VW.YView, 0 )+17);
    
    for(i = 1; i <= ceil(global.weapons[global.currentWeapon].ammo); i += 1) {
        draw_sprite_ext(sprHealthbarPrimary, 0, __view_get( e__VW.XView, 0 )+7+1+5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.primaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, __view_get( e__VW.XView, 0 )+7+1+5, __view_get( e__VW.YView, 0 )+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.secondaryCol, 1);
    }
}

//Weapon icon (when using quick weapon switching)
var myStartingPoint = instance_nearest(x, y, objArenaStartingPoint);
var myTimer = instance_nearest(x, y, objBossDeathTimer);
if !((myStartingPoint > -1 and myStartingPoint.isMM) or (myTimer > -1 and myTimer.isMM)) {
	if instance_exists(prtPlayer) && !prtPlayer.teleporting && !prtPlayer.showReady && !prtPlayer.dead {
		if prtPlayer.drawWeaponIcon {
		    if !prtPlayer.climbing
		        draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(prtPlayer.x-8) + prtPlayer.image_xscale, round(prtPlayer.y-30), 1, 1, 0, c_white, 1);
		    else
		        draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(prtPlayer.x-8), round(prtPlayer.y-30), 1, 1, 0, c_white, 1);
		}
	}
}
else if myStartingPoint > -1 && myStartingPoint.isMM {
	if instance_exists(prtPlayer) && !prtPlayer.dead {
		if prtPlayer.drawWeaponIcon {
		    if !prtPlayer.climbing
		        draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(myStartingPoint.x-8) + myStartingPoint.image_xscale, round(myStartingPoint.y-30), 1, 1, 0, c_white, 1);
		    else
		        draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(myStartingPoint.x-8), round(myStartingPoint.y-30), 1, 1, 0, c_white, 1);
		}
	}
}
else if myTimer > -1 && myTimer.isMM {
	if instance_exists(prtPlayer) && !prtPlayer.dead && !myTimer.teleporting {
		if prtPlayer.drawWeaponIcon {
			if !prtPlayer.climbing
			    draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(myTimer.x-8) + myTimer.image_xscale, round(myTimer.y-30), 1, 1, 0, c_white, 1);
			else
			    draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(myTimer.x-8), round(myTimer.y-30), 1, 1, 0, c_white, 1);
		}
	}
}

if cfgShowLives {
    draw_set_colour(c_white);
    draw_text(__view_get( e__VW.XView, 0 )+7+8+1+5, __view_get( e__VW.YView, 0 )+18+sprite_get_height(sprHealthbarBackground), string_hash_to_newline(string(max(0,global._lives))));
}

if (cfgDebug || debug_mode) {
	draw_set_colour(c_white);
	var _oldFont = draw_get_font();
	draw_set_font(global.MM3font);
    draw_text( __view_get( e__VW.XView, 0 )+7+8+8+1+5+16, __view_get( e__VW.YView, 0 )+17+16, "X: " + string(x));
	draw_text( __view_get( e__VW.XView, 0 )+7+8+8+1+5+16, __view_get( e__VW.YView, 0 )+34+16, "Y: " + string(y));
	draw_set_font(_oldFont);
}

