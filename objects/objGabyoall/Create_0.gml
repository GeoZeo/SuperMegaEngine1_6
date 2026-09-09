//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)
//dir = -1/1 (1 = faces right (default); -1 = faces left)

event_inherited();

contactDamage = 3;

var damages = array_length_1d(damage);
for (var i = 0; i < damages; i++) {
    damage[i] = 0;
}

damage[objBusterShot] = 0;
damage[objBusterShotHalfCharged] = 0;
damage[objBusterShotCharged] = 0;
damage[objProtoBusterShotHalfCharged] = 0;
damage[objProtoBusterShotCharged] = 0;
damage[objMetalBlade] = 0;
damage[objNeedleCannon] = 0;
damage[objChargeKick] = 0;
damage[objPharaohShot] = 1;
damage[objPharaohShotCharging] = 1;
damage[objPharaohShotCharged] = 1;
damage[objDrillBomb] = 0;
damage[objDrillBombExplosion] = 1;
damage[objStarCrash] = 0;
damage[objCentaurFlash] = 0;
damage[objSilverTomahawk] = 0;
damage[objWindStorm] = 0;
damage[objHornetChaser] = 0;
damage[objTimeSlow] = 1;

instantItemSpawn = true;

//Enemy specific code
col = 0; //0 = red; 1 = orange; 2 = blue
frozeTimer = 0;
dashing = false;
startDir = -1; // Default start direction is left.
player_sprite_yoffset = 0;
player_sprite_height = 0;

image_speed = 0.2;
image_index = 0;

alarm[0] = 1;

