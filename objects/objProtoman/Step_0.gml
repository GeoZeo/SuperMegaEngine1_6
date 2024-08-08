event_inherited();

if global.frozen == false {

	//Handles projectile reflection/deflection
	playerShielding(!ground and !isShoot and !isThrow and !climbing and !isHit and !isSlide and !isStun and (!instance_exists(objBeat) or objBeat.transportTimer >= objBeat.transportTime) and !dead);
	
}


