/// @description mask_get_xcenter_object(obj)
function mask_get_xcenter_object(argument0) {

	var v;
	v = argument0;
	return round(v.x - sprite_get_xoffset(v.mask_index) + (sprite_get_width(v.mask_index)/2));



}
