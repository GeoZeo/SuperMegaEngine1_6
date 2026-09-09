/// @description playerCollisionEnd()
function playerCollisionEnd() {
	//Prepares jumping/moving platform variables for subsequent code/the next frame
	
	
	//Can we actually jump now? This prevents us from being able to jump before collision behaviours are able to occur.
	canJump = ground;
	if ground { jumps = 0; }
	else if jumps < 1 { jumps = 1; }
	
	
	//Reset moving platform speed floats.
	pltSpeedX = 0;
	pltSpeedY = 0;
	
	
	//if xspeedRollback != -1000000
	//	xspeedRollback -= global.xforce;
	
	//if yspeedRollback != -1000000
	//	yspeedRollback -= global.yforce;
	
	
	//if _x_rb != 0 and global.xspeed == 0 and !rollbackMovement
	//{
	//	global.xforce = 0;
	//}
	
	
}