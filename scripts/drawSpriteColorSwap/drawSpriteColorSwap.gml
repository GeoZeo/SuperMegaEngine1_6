/// @description  drawSpriteColorSwap(spr, subimg, sx, sy, src_col, col)
/// Draw sprite replacing one color
function drawSpriteColorSwap(argument0, argument1, argument2, argument3, argument4, argument5) {

	var spr = argument0;
	var subimg = argument1;
	var sx = argument2;
	var sy = argument3;

	var src_col = argument4;

	var col = argument5;

	shader_set(shColorReplace);

	var shader_params;

	shader_params = shader_get_uniform(shColorReplace, "colorIn");
	shader_set_uniform_f(shader_params, color_get_red(src_col) / 255.0, color_get_green(src_col) / 255.0, color_get_blue(src_col) / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace, "colorOut");
	shader_set_uniform_f(shader_params, color_get_red(col) / 255.0, color_get_green(col) / 255.0, color_get_blue(col) / 255.0, 1.0);

	draw_sprite(spr, subimg, sx, sy);

	shader_reset();



}
