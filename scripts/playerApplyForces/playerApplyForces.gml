/// @description playerApplyForces()
function playerApplyForces() {
	//Moves the player via forces such as wind
	
	if x_force == 0 && global.yforce == 0 exit;
	
	global.xspeed += x_force;
	global.yspeed += global.yforce;
	
	move(x_force, global.yforce);
	
	playLandSound = false;
	
	playerCollision();
	playerMovingPlatform();
	playerSpikes();
	playerCollisionEnd();



}
