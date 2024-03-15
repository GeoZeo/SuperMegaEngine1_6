/// @description gravityNoGroundExt(grav)
function gravityNoGroundExt(argument0) {
	//Applies gravity no matter what

	yspeed += argument0 * update_rate;
	if yspeed > cfgMaxFallingSpeed
	    yspeed = cfgMaxFallingSpeed;



}
