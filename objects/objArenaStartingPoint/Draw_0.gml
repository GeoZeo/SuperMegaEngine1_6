if isMM == true && instance_exists(prtPlayer)
{
	drawPlayer();
	
	//Weapon icon (when using quick weapon switching)
    if prtPlayer.drawWeaponIcon {
        if !prtPlayer.climbing
            draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(x-8) + image_xscale, round(y-30), 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(sprWeaponIconsColor, global.weapons[global.weapon].ID, round(x-8), round(y-30), 1, 1, 0, c_white, 1);
    }
}

	