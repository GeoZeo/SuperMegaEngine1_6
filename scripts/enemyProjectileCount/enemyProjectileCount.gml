/// @description enemyProjectileCount(projectileIndex): returns the number of active enemy projectiles of a
/// certain type on screen that have been created by a given enemy instance
function enemyProjectileCount(argument0) {
	
	var count = 0;
	
	for (var i = 0; i < instance_number(argument0); i++) {
		if instance_find(argument0, i).id_of_origin == id 
			count++;
	}
	
	for (var i = 0; i < instance_number(objReflectedProjectile); i++) {
		if instance_find(objReflectedProjectile, i).projID == argument0
		&& instance_find(objReflectedProjectile, i).id_of_origin == id
			count++;
	}

	return count;

}