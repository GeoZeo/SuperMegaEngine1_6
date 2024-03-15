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

tile_layer_show(curr_layer);
//curr_layer--;

//Tile animations
var _layers = layer_get_id_at_depth(curr_layer);
var _numLayers = array_length(_layers);

for(var i = 0; i < _numLayers; i++) {
	var _layer = _layers[i];
	
	if array_contains(validLayers, _layer) {
		
		if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
		
			var _tilemap = layer_tilemap_get_id(_layer);
		
			if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
				layer_set_visible(_layer, true);
			}
		}
	}
}
curr_layer--;
if curr_layer < global.end_layer {
    curr_layer = global.ini_layer;
    for (var l = global.ini_layer; l >= global.end_layer; l--) {
		
		_layers = layer_get_id_at_depth(l);
		_numLayers = array_length(_layers);

		for(var j = 0; j < _numLayers; j++) {
			var _layer = _layers[j];
			
			if array_contains(validLayers, _layer) {
				
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
if curr_layer < global.end_layer {
    curr_layer = global.ini_layer;
    for (var l = global.ini_layer; l >= global.end_layer; l--) {
        tile_layer_hide(l);
    }
}

if instance_exists(prtPlayer) {
	if !prtPlayer.climbing
		cameraXOffset = prtPlayer.image_xscale;
	else
		cameraXOffset = 0;
}

///Debug keys
if !cfgEnableDebugKeys {
    exit;
}

if keyboard_check_pressed(vk_f2)
{
    application_surface_draw_enable(true);
    sound_stop_all();
    game_restart();
}

// Suicide.
if keyboard_check_pressed(vk_f3)
{
    global._health = 0;
}
    
if keyboard_check_pressed(vk_f4)
    window_set_fullscreen( !window_get_fullscreen() );
    
if keyboard_check_pressed(vk_escape)
    game_end();
    

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

