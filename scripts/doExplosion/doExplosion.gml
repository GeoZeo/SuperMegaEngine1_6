/// @description doExplosion(xx,yy,spd,dpth)
function doExplosion(argument0, argument1, argument2, argument3) {
	var xx = argument0;
	var yy = argument1;
	var spd = argument2;
	var dpth = argument3;

	var i = 0
	repeat 8 {
	    explosionID = instance_create(xx, yy, objMegamanExplosion);
	        explosionID.dir = i;
	        explosionID.spd = spd;
			explosionID.depth = dpth;
	    i += 45;
	}



}
