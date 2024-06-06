/// @description projectileCount(): returns the number of player active projectiles on screen
function projectileCount() {

	var count = 0;
	
	with objReflectedProjectile {
		if id_of_origin == prtPlayer count++;
	}

	with prtPlayerProjectile {
	    if !doesNotCount count++;
	}

	return count;



}
