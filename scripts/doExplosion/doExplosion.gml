/// @description doExplosion(xx,yy,spd)
function doExplosion(argument0, argument1, argument2) {
	var xx = argument0;
	var yy = argument1;
	var spd = argument2;

	var i = 0
	repeat 8 {
	    explosionID = instance_create(xx, yy, objMegamanExplosion);
	        explosionID.dir = i;
	        explosionID.spd = spd;
	    i += 45;
	}



}
