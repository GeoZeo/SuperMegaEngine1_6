/// @description projectileCount(): returns the number of player active projectiles on screen
function projectileCount() {

	var count = instance_number(objReflectedProjectile);

	with prtPlayerProjectile {
	    if !doesNotCount count++;
	}

	return count;



}
