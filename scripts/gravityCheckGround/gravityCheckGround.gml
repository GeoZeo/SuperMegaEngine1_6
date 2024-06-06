/// @description gravityCheckGround()
function gravityCheckGround() {
	//Applies gravity only if we are not on the ground
	//Make sure to specify the variable 'ground' in the object [if necessary, use checkGround()]

	if !ground {
	    yspeed += cfgGravity * update_rate;
	    if yspeed > cfgMaxFallingSpeed
	        yspeed = cfgMaxFallingSpeed;
	}

	if object_is_ancestor(object_index, prtEnemyProjectile)
		destroyOnReflect = true;



}
