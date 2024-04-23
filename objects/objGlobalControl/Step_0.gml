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

var _layers_back = layer_get_id_at_depth(curr_back_layer);
var _numLayers_back = array_length(_layers_back);

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
curr_back_layer--;
if curr_back_layer < global.end_back_layer {
    curr_back_layer = global.ini_back_layer;
    for (var l = global.ini_back_layer; l >= global.end_back_layer; l--) {
		
		_layers_back = layer_get_id_at_depth(l);
		_numLayers_back = array_length(_layers_back);

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

var _layers_front = layer_get_id_at_depth(curr_front_layer);
var _numLayers_front = array_length(_layers_front);

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
curr_front_layer--;
if curr_front_layer < global.end_front_layer {
    curr_front_layer = global.ini_front_layer;
    for (var l = global.ini_front_layer; l >= global.end_front_layer; l--) {
		
		_layers_front = layer_get_id_at_depth(l);
		_numLayers_front = array_length(_layers_front);

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
        tile_layer_hide(l);
    }
}
//if curr_layer_front < global.end_front_layer {
//    curr_layer_front = global.ini_front_layer;
//    for (var l = global.ini_front_layer; l >= global.end_front_layer; l--) {
//        tile_layer_hide(l);
//    }
//}

if instance_exists(prtPlayer) {
	if !prtPlayer.climbing && (!prtPlayer.isSlide or prtPlayer.slideSpeed == 0)
		cameraXOffset = prtPlayer.image_xscale;
	else
		cameraXOffset = 0;
}

//Non-debug QoL keys
//Restart the game
if keyboard_check_pressed(vk_f1)
{
    application_surface_draw_enable(true);
    sound_stop_all();
    game_restart();
}

//Reset window transform to default
if keyboard_check_pressed(vk_f2) {
	window_set_size(768, 672);
	
	if window_get_showborder()
		window_set_position(576, 215);
	else
		window_set_position(576, 204);
		
	window_set_fullscreen(false);
}

//Toggle borderless window
if keyboard_check_pressed(vk_f3)
    window_set_showborder( !window_get_showborder() );
    
//Toggle fullscreen
if keyboard_check_pressed(vk_f4)
    window_set_fullscreen( !window_get_fullscreen() );
    
//Close the game
if keyboard_check_pressed(vk_escape)
    game_end();

///Debug keys
if !cfgEnableDebugKeys {
    exit;
}

// Suicide.
if keyboard_check_pressed(vk_f5)
{
    global._health = 0;
}

if keyboard_check_pressed(vk_f6) debug_password();
if keyboard_check_pressed(vk_f7) saveGame(0);
if keyboard_check_pressed(vk_f8) loadGame(0);
//if keyboard_check_pressed(vk_f11) with prtPlayer grav *= -1;

if keyboard_check(vk_add) global.screws = min(global.maxScrews, global.screws + 2);
if keyboard_check(vk_subtract) global.screws = max(0, global.screws - 2);

if keyboard_check_pressed(vk_f9) {
    global.current_screen_shader++;
    if global.current_screen_shader >= global.num_screen_shaders {
        global.current_screen_shader = 0;
        application_surface_draw_enable(true);
    }
    else {
        application_surface_draw_enable(false);
    }
    global.screen_shader = global.screen_shaders[global.current_screen_shader];
    show_debug_message("Current shader: " +  string(global.current_screen_shader));
}

if keyboard_check_pressed(vk_f10) {
	var myEnemy = instance_create(prtPlayer.x, prtPlayer.y-112, objTelly);
}

if keyboard_check_pressed(vk_f11) {
	reset_achievements();
}