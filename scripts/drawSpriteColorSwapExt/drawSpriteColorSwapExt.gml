/// @description  drawSpriteColorSwapExt(spr, subimg, sx, sy, xscale, yscale, rot, src_col, col, alpha)
/// Draw sprite with additional options replacing one color
function drawSpriteColorSwapExt(argument0, argument1, argument2, argument3, argument4, argument5,  argument6, argument7, argument8, argument9) {

	var spr = argument0;
	var subimg = argument1;
	var sx = argument2;
	var sy = argument3;
	var xscale = argument4;
	var yscale = argument5;
	var rot = argument6;

	var src_col = argument7;

	var col = argument8;
	
	var alpha = argument9;

	shader_set(shColorReplace);

	var shader_params;

	shader_params = shader_get_uniform(shColorReplace, "colorIn");
	shader_set_uniform_f(shader_params, color_get_red(src_col) / 255.0, color_get_green(src_col) / 255.0, color_get_blue(src_col) / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace, "colorOut");
	shader_set_uniform_f(shader_params, color_get_red(col) / 255.0, color_get_green(col) / 255.0, color_get_blue(col) / 255.0, 1.0);

	draw_sprite_ext(spr, subimg, sx, sy, xscale, yscale, rot, c_white, alpha);

	shader_reset();



}
