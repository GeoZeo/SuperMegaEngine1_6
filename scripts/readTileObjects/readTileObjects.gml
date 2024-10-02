/// @description  readTileObjects
function readTileObjects() {
	// Must be called from rmInit

	global.tiles = ds_map_create();
	
	var _layers = layer_get_id_at_depth(1000000);
	var _numLayers = array_length_1d(_layers);
	for(var i = 0; i < _numLayers; i++) {
	
		if (layer_tilemap_exists(_layers[i], layer_tilemap_get_id(_layers[i]))) {
			
			var _tilemap = layer_tilemap_get_id(_layers[i]);
	
			if((_tilemap > -1) && (layer_get_element_type(_tilemap) == layerelementtype_tilemap)) {
				var _tileset = tilemap_get_tileset(_tilemap);
		
				if (_tileset > -1) {
					with all {
					    var tile = tilemap_get_at_pixel(_tilemap, x, y);
				
					    if tile > 0 {
					
							//show_debug_message("{0}, {1}", _tilemap, tile);
					
							var tbg = _tileset;
							var ti = tile_get_index(tile);
					
					        var tile_id = string(tbg) + "," + string(ti);
							//show_debug_message(tile_id);
					
					        ds_map_add(global.tiles, tile_id, object_index);
					    }
					}
				}
			}
		}
	}




}
