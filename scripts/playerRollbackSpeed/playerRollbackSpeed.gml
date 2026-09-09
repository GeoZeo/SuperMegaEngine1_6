/// @description playerRollbackSpeed()
function playerRollbackSpeed() {
	//Rolls back change in speed caused by collisions.
	//Used for Beat physics.

	if xspeedRollback != -1000000
		global.xspeed = xspeedRollback;
			
	if yspeedRollback != -1000000
		global.yspeed = yspeedRollback;
	
	xspeedRollback = -1000000;
	yspeedRollback = -1000000;



}
