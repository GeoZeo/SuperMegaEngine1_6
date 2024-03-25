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

//Tile animations
tile_layer_show(curr_backLayer);
//curr_backLayer--;

var _frontLayers = layer_get_id_at_depth(curr_backLayer);
var _numFrontLayers = array_length(_frontLayers);

for(var i = 0; i < _numFrontLayers; i++) {
	var _layer = _frontLayers[i];
	
	if array_contains(validBackLayers, _layer) {
		
		if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
		
			var _tilemap = layer_tilemap_get_id(_layer);
		
			if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
				layer_set_visible(_layer, true);
			}
		}
	}
}
curr_backLayer--;
if curr_backLayer < global.end_backLayer {
    curr_backLayer = global.ini_backLayer;
    for (var l = global.ini_backLayer; l >= global.end_backLayer; l--) {
		
		_frontLayers = layer_get_id_at_depth(l);
		_numFrontLayers = array_length(_frontLayers);

		for(var j = 0; j < _numFrontLayers; j++) {
			var _layer = _frontLayers[j];
			
			if array_contains(validBackLayers, _layer) {
				
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
if curr_backLayer < global.end_backLayer {
    curr_backLayer = global.ini_backLayer;
    for (var l = global.ini_backLayer; l >= global.end_backLayer; l--) {
        tile_layer_hide(l);
    }
}

tile_layer_show(curr_frontLayer);
//curr_backLayer--;

var _backLayers = layer_get_id_at_depth(curr_frontLayer);
var _numBackLayers = array_length(_backLayers);

for(var i = 0; i < _numBackLayers; i++) {
	var _layer = _backLayers[i];
	
	if array_contains(validFrontLayers, _layer) {
		
		if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
		
			var _tilemap = layer_tilemap_get_id(_layer);
		
			if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
				layer_set_visible(_layer, true);
			}
		}
	}
}
curr_frontLayer--;
if curr_frontLayer < global.end_frontLayer {
    curr_frontLayer = global.ini_frontLayer;
    for (var l = global.ini_frontLayer; l >= global.end_frontLayer; l--) {
		
		_backLayers = layer_get_id_at_depth(l);
		_numBackLayers = array_length(_backLayers);

		for(var j = 0; j < _numBackLayers; j++) {
			var _layer = _backLayers[j];
			
			if array_contains(validFrontLayers, _layer) {
				
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
if curr_frontLayer < global.end_frontLayer {
    curr_frontLayer = global.ini_frontLayer;
    for (var l = global.ini_frontLayer; l >= global.end_frontLayer; l--) {
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

if keyboard_check_pressed(vk_f10) {
	var myEnemy = instance_create(prtPlayer.x, prtPlayer.y-112, objTelly);
}

if keyboard_check_pressed(vk_f11) {
	reset_achievements();
}