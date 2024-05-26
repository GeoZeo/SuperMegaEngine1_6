/// @description  onDeath
//Switching to phase 2
if sprite_index == sprWilyMachine4a {
    sprite_index = sprWilyMachine4b;
    hitbox_left = 14;
    hitbox_top = 36;
    hitbox_bottom = 48;
    damage[objSilverTomahawk] = 4;
    damage[objDrillBomb] = 4;
    damage[objDrillBombExplosion] = 4;
    damage[objPharaohShot] = 0;
    damage[objPharaohShotCharging] = 0;
    damage[objPharaohShotCharged] = 0;
    damage[objWindStorm] = 7;
    alarm[0] = -1;
    nullifyDeath(false);
}
else if !dying {
	add_achievement(objLudditeAchievement);
	
	//Death animation
	hitbox_left = 0;
	hitbox_top = 0;
	hitbox_right = 0;
	hitbox_bottom = 0;
	contactDamage = 0;
	alarm[0] = -1;
	nullifyDeath(false);
	dying = true;
	xspeed = 0;
	yspeed = 0.15;
	if alarm[1] < 0
		alarm[1] = 180;
}

