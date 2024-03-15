/// @description sprite_get_ycenter_object(id)
function sprite_get_ycenter_object(argument0) {

	var v;
	v = argument0;
	return round((v.y - v.sprite_yoffset) + (v.sprite_height/2));



}
