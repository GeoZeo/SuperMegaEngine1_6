/// @description sprite_get_xcenter_object(id)
function sprite_get_xcenter_object(argument0) {

	var v;
	v = argument0;
	return round((v.x - v.sprite_xoffset) + (v.sprite_width/2));



}
