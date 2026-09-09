if instance_exists(prtPlayer) {
    x = prtPlayer.x;
    y = prtPlayer.y;
}

if global.loopEnd > -1 && global.loopStart > -1 && global.bgm > -1 {    //Loop point
    var currPos = audio_sound_get_track_position(global.bgm);
    if currPos >= global.loopEnd - 0.1 {
        var diff = global.loopEnd - global.loopStart;
        var newPos = currPos - diff;
        audio_sound_set_track_position(global.bgm, newPos);
    }
}

//Tile animations (midground)
tile_layer_show(curr_back_layer);
//curr_layer--;

if array_length_1d(validLayers_back) > 0 {
	var _layers_back = layer_get_id_at_depth(curr_back_layer);
	var _numLayers_back = array_length_1d(_layers_back);

	for(var i = 0; i < _numLayers_back; i++) {
		var _layer = _layers_back[i];
	
		if array_contains(validLayers_back, _layer) {
		
			if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
		
				var _tilemap = layer_tilemap_get_id(_layer);
		
				if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
					layer_set_visible(_layer, true);
				}
			}
		}
	}
}
curr_back_layer--;
if curr_back_layer < global.end_back_layer {
    curr_back_layer = global.ini_back_layer;
    for (var l = global.ini_back_layer; l >= global.end_back_layer; l--) {
		
		if array_length_1d(validLayers_back) > 0 {
			var _layers_back = layer_get_id_at_depth(l);
			var _numLayers_back = array_length_1d(_layers_back);

			for(var j = 0; j < _numLayers_back; j++) {
				var _layer = _layers_back[j];
			
				if array_contains(validLayers_back, _layer) {
				
					if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
				
						var _tilemap = layer_tilemap_get_id(_layer);
		
						if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
							layer_set_visible(_layer, false);
						}
					}
				}
			}
		}
        tile_layer_hide(l);
    }
}
//if curr_layer < global.end_back_layer {
//    curr_layer = global.ini_back_layer;
//    for (var l = global.ini_back_layer; l >= global.end_back_layer; l--) {
//        tile_layer_hide(l);
//    }
//}

//Tile animations (foreground)
tile_layer_show(curr_front_layer);
//curr_layer--;

if array_length_1d(validLayers_front) > 0 {
	var _layers_front = layer_get_id_at_depth(curr_front_layer);
	var _numLayers_front = array_length_1d(_layers_front);

	for(var i = 0; i < _numLayers_front; i++) {
		var _layer = _layers_front[i];
	
		if array_contains(validLayers_front, _layer) {
		
			if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
		
				var _tilemap = layer_tilemap_get_id(_layer);
		
				if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
					layer_set_visible(_layer, true);
				}
			}
		}
	}
}
curr_front_layer--;
if curr_front_layer < global.end_front_layer {
    curr_front_layer = global.ini_front_layer;
    for (var l = global.ini_front_layer; l >= global.end_front_layer; l--) {
		
		if array_length_1d(validLayers_front) > 0 {
			var _layers_front = layer_get_id_at_depth(l);
			var _numLayers_front = array_length_1d(_layers_front);

			for(var j = 0; j < _numLayers_front; j++) {
				var _layer = _layers_front[j];
			
				if array_contains(validLayers_front, _layer) {
				
					if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
				
						var _tilemap = layer_tilemap_get_id(_layer);
		
						if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
							layer_set_visible(_layer, false);
						}
					}
				}
			}
		}
        tile_layer_hide(l);
    }
}
//if curr_layer_front < global.end_front_layer {
//    curr_layer_front = global.ini_front_layer;
//    for (var l = global.ini_front_layer; l >= global.end_front_layer; l--) {
//        tile_layer_hide(l);
//    }
//}

//Non-debug QoL keys
//Restart the game
if keyboard_check_pressed(vk_f1)
{
    sound_stop_all();
    game_restart();
}

//Reset window transform to default
if keyboard_check_pressed(vk_f2) {
	
	toggleFullScreen(false);
	
	window_set_size(global.winWidthInit, global.winHeightInit);
	
	if !keyboard_check(vk_alt) { 
		window_set_position(global.winX, global.winY - (11 * !window_get_showborder()));
	}
	else {
		window_set_showborder(true);
		window_set_cursor(cr_default);
		window_set_position(global.winX, global.winY);
	}
}

//Match window dimensions to application surface dimensions (only works while un-maximised), or toggle borderless window
if keyboard_check_pressed(vk_f3) {
	if !keyboard_check(vk_alt) {
		window_set_size(surface_get_width(application_surface), surface_get_height(application_surface));
	}
	else {
		window_set_showborder( !window_get_showborder() );
	}
}
    
//Toggle fullscreen
if keyboard_check_pressed(vk_f4) {
    toggleFullScreen( !window_get_fullscreen() );
}
	
//Toggle cursor visibility
if keyboard_check_pressed(vk_f5) {
	if window_get_cursor() != cr_none
		window_set_cursor(cr_none);
	else
		window_set_cursor(cr_default);
}

//Adjust screen dimensions and offsets in accordance with window size
if !window_get_fullscreen() {
	global.winWidth = window_get_width();
	global.winHeight = window_get_height();
	
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
    
//Close the game
if keyboard_check_pressed(vk_escape)
    game_end();

///Debug keys
if !cfgEnableDebugKeys {
    exit;
}

// Suicide.
if keyboard_check_pressed(vk_f6)
{
	instance_activate_object(prtPlayer);
    global._health = 0;
}

if keyboard_check_pressed(vk_f7) debug_password();
if keyboard_check_pressed(vk_f8) saveGame(0);
if keyboard_check_pressed(vk_f9) loadGame(0);
//if keyboard_check_pressed(vk_f11) with prtPlayer grav *= -1;

if keyboard_check(vk_add) global.screws = min(global.maxScrews, global.screws + 2);
if keyboard_check(vk_subtract) global.screws = max(0, global.screws - 2);

if keyboard_check_pressed(vk_f10) {
	if !keyboard_check(vk_alt) {
	    global.current_screen_shader++;
	    if global.current_screen_shader >= global.num_screen_shaders
	        global.current_screen_shader = 0;
		
	    global.screen_shader = global.screen_shaders[global.current_screen_shader];
	    show_debug_message("Current shader: " +  string(global.current_screen_shader));
	}
	else {
		global.current_screen_border++;
	    if global.current_screen_border >= global.num_screen_borders
	        global.current_screen_border = 0;
		
	    global.screen_border = global.screen_borders[global.current_screen_border];
	    show_debug_message("Current border: " +  string(global.current_screen_border));
	}
}

if keyboard_check_pressed(vk_f11) {
	if keyboard_check(vk_alt) {
		with objFanFiend {
			if insideView() {
				instance_destroy();
			}
		}
	}
	else {
		var myEnemy = instance_create(x + 96, y - 64, objFanFiend);
		myEnemy.dir = -1;
		myEnemy.respawn = false;
		//with prtPlayer playerStun(60, false, 0.125);
	}
	//instance_create(x, y, objShake);
}

if keyboard_check_pressed(vk_f12) {
	
	if keyboard_check(vk_alt) {
		reset_achievements();
	}
	else {
		for (var i = 0; object_exists(i); i++) {
			if object_is_ancestor(i, prtAchievement) {
				add_achievement(i, true);
			}
		}
	}
}