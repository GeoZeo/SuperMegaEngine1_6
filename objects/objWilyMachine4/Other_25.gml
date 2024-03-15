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
    refillHealthBar();
}
else {
    add_achievement(objLudditeAchievement);
}

