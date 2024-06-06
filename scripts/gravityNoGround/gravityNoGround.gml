/// @description gravityNoGround()
function gravityNoGround() {
	//Applies gravity no matter what

	yspeed += cfgGravity * update_rate;
	if yspeed > cfgMaxFallingSpeed
	    yspeed = cfgMaxFallingSpeed;
		
	if object_is_ancestor(object_index, prtEnemyProjectile)
		destroyOnReflect = true;



}
