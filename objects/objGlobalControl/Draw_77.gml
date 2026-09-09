//Reset shake amount
global.shakeX = 0;
global.shakeY = 0;

if window_get_fullscreen() && global.screen_border != noone
{
	var _borderStr;
	if !is_string(global.screen_border)
		_borderStr = string(global.screen_border);
	else
		_borderStr = global.screen_border;
	
	var _border = asset_get_index("sb" + _borderStr);
		
	if sprite_exists(_border)
	{
		var _resMultiplier = min(floor(global.displayWidth / global.viewWidth), floor(global.displayHeight / global.viewHeight));
		
		var _winWidth = global.viewWidth * _resMultiplier;
		var _winHeight = global.viewHeight * _resMultiplier;
	
		var _borderXscale = global.displayWidth / sprite_get_width(_border);
		var _borderYscale = global.displayHeight / sprite_get_height(_border);
	
		var _bgXscale = _winWidth / sprite_get_width(sprWinBG);
		var _bgYscale = _winHeight / sprite_get_height(sprWinBG);
		
		draw_sprite_ext(_border, 0, 0, 0, _borderXscale, _borderYscale, 0, c_white, 1);
		draw_sprite_ext(sprWinBG, 0, global.Xoffset, global.Yoffset, _bgXscale, _bgYscale, 0, c_white, 1);	
	}
}

var _isShader = global.screen_shader != noone

if _isShader
	shader_set(global.screen_shader);

draw_surface_ext(application_surface, global.Xoffset, global.Yoffset, 1, 1, 0, c_white, 1);

if _isShader
	shader_reset();
	
