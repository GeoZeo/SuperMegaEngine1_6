/// @description drawSelf()
function drawSelf() {
	if sprite_index > -1 and visible
		draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);


}
