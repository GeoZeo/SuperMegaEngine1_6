/// @description Toggles whether the game is in fullscreen. Supports perfect sprite scaling!
/// @param flag - whether we're turning it on or off, bool
function toggleFullScreen(argument0) {
	if argument0 {
		window_set_fullscreen(true);

		global.displayWidth = display_get_width();
		global.displayHeight = display_get_height();

		global.viewWidth = 256;
		global.viewHeight = 224;

		var _resMultiplier = min(floor(global.displayWidth / global.viewWidth), floor(global.displayHeight / global.viewHeight));
		
		var _winWidth = global.viewWidth * _resMultiplier;
		var _winHeight = global.viewHeight * _resMultiplier;

		global.Xoffset = (global.displayWidth - global.viewWidth) / 2;
		global.Yoffset = (global.displayHeight - global.viewHeight) / 2;

		if global.displayWidth >= _winWidth && global.displayHeight >= _winHeight
		&& !(_winWidth < global.viewWidth || _winHeight < global.viewHeight) 
		{
			surface_resize(application_surface, _winWidth, _winHeight)
			global.Xoffset = (global.displayWidth - _winWidth) / 2;
			global.Yoffset = (global.displayHeight - _winHeight) / 2;
		}
	}
	else {
		window_set_fullscreen(false);
		
		var _mult = min(floor(global.winWidth / global.viewWidth), floor(global.winHeight / global.viewHeight));
		
		var _newWidth = global.viewWidth * _mult;
		var _newHeight = global.viewHeight * _mult;
	
		if !(_newWidth < global.viewWidth || _newHeight < global.viewHeight) 
		{
			surface_resize(application_surface, _newWidth, _newHeight);
		
			global.Xoffset = floor((global.winWidth - surface_get_width(application_surface)) / 2);
			global.Yoffset = floor((global.winHeight - surface_get_height(application_surface)) / 2);
		}
	}
}