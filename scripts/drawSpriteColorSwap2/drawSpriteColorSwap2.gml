/// @description  drawSpriteColorSwap2(spr, subimg, sx, sy, src_col1, src_col2, col1, col2)
/// Draw sprite replacing two colors
function drawSpriteColorSwap2(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var spr = argument0;
	var subimg = argument1;
	var sx = argument2;
	var sy = argument3;

	var src_col1 = argument4;
	var src_col2 = argument5;

	var col1 = argument6;
	var col2 = argument7;

	shader_set(shColorReplace2);

	var shader_params;

	//Primary Color
	shader_params = shader_get_uniform(shColorReplace2, "colorIn1");
	shader_set_uniform_f(shader_params, color_get_red(src_col1) / 255.0, color_get_green(src_col1) / 255.0, color_get_blue(src_col1) / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace2, "colorOut1");
	shader_set_uniform_f(shader_params, color_get_red(col1) / 255.0, color_get_green(col1) / 255.0, color_get_blue(col1) / 255.0, 1.0);

	//Secondary Color
	shader_params = shader_get_uniform(shColorReplace2, "colorIn2");
	shader_set_uniform_f(shader_params, color_get_red(src_col2) / 255.0, color_get_green(src_col2) / 255.0, color_get_blue(src_col2) / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace2, "colorOut2");
	shader_set_uniform_f(shader_params, color_get_red(col2) / 255.0, color_get_green(col2) / 255.0, color_get_blue(col2) / 255.0, 1.0);

	draw_sprite(spr, subimg, sx, sy);

	shader_reset();



}
