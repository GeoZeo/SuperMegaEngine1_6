/// @description  drawSpriteColorSwapExt3(spr, subimg, sx, sy, xscale, yscale, rot, src_col1, src_col2, src_col3, col1, col2, col3, alpha)
/// Draw sprite with additional options replacing three colors
function drawSpriteColorSwapExt3(argument0, argument1, argument2, argument3, argument4, argument5,  argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13) {

	var spr = argument0;
	var subimg = argument1;
	var sx = argument2;
	var sy = argument3;
	var xscale = argument4;
	var yscale = argument5;
	var rot = argument6;

	var src_col1 = argument7;
	var src_col2 = argument8;
	var src_col3 = argument9;

	var col1 = argument10;
	var col2 = argument11;
	var col3 = argument12;
	
	var alpha = argument13;

	shader_set(shColorReplace3);

	var shader_params;

	//Primary Color
	shader_params = shader_get_uniform(shColorReplace3, "colorIn1");
	shader_set_uniform_f(shader_params, color_get_red(src_col1) / 255.0, color_get_green(src_col1) / 255.0, color_get_blue(src_col1) / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace3, "colorOut1");
	shader_set_uniform_f(shader_params, color_get_red(col1) / 255.0, color_get_green(col1) / 255.0, color_get_blue(col1) / 255.0, 1.0);

	//Secondary Color
	shader_params = shader_get_uniform(shColorReplace3, "colorIn2");
	shader_set_uniform_f(shader_params, color_get_red(src_col2) / 255.0, color_get_green(src_col2) / 255.0, color_get_blue(src_col2) / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace3, "colorOut2");
	shader_set_uniform_f(shader_params, color_get_red(col2) / 255.0, color_get_green(col2) / 255.0, color_get_blue(col2) / 255.0, 1.0);

	//Third Color
	shader_params = shader_get_uniform(shColorReplace3, "colorIn3");
	shader_set_uniform_f(shader_params, color_get_red(src_col3) / 255.0, color_get_green(src_col3) / 255.0, color_get_blue(src_col3) / 255.0, 1.0);
	shader_params = shader_get_uniform(shColorReplace3, "colorOut3");
	shader_set_uniform_f(shader_params, color_get_red(col3) / 255.0, color_get_green(col3) / 255.0, color_get_blue(col3) / 255.0, 1.0);

	draw_sprite_ext(spr, subimg, sx, sy, xscale, yscale, rot, c_white, alpha);

	shader_reset();



}
