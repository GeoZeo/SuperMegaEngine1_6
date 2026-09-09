if movedByPlatform == false
    movedPlatformID = -20;
movedByPlatform = false;
if global._health > 0 pushedBySpawnedSolid = false;

//Variables on the previous frame
prevGround = ground;
prevXScale = image_xscale;

old_x = x;
old_y = y;

//if !rollbackMovement
//{
//	xspeedRollback = -1000000;
//	yspeedRollback = -1000000;
//}

//xDiff = -1000000;
//yDiff = -1000000;

//global.xspeed -= global.xforce;
//global.yspeed -= global.yforce;
global.xforce = 0;
global.yforce = 0;

if pause {
	global.frozen = true;
	instance_create(x, y, objPauseMenu);
	stopSFX(sfxLand);
	stopSFX(sfxTeleportOut);
	playSFX(sfxPause);
	pause = false;
}

print("END");