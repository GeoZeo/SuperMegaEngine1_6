/// @description  placeTileAnimations()
function placeTileAnimations() {

	var tiles = tile_get_ids();
	var num_tiles = array_length_1d(tiles);

	for (var i = 0; i < num_tiles; i++) {
		if tiles[i] > -1 {
		    var tid = tiles[i];
		    var tx = tile_get_x(tid);
		    var ty = tile_get_y(tid);
		    var real_tx = tile_get_x(tid);
		    var real_ty = tile_get_y(tid);
		    var tw = tile_get_width(tid);
		    var th = tile_get_height(tid);
		    var tile_id = tile_get_type(tid, tx - real_tx, ty - real_ty);
		    var tiles_ = ds_map_find_value(global.anims2, tile_id);
		    if tiles_ > -1 {
		        var key = ds_map_find_first(tiles_);
		        while (!is_undefined(key)) {
		            var tile = ds_map_find_value(tiles_, key);
		            var parts = split(tile, ",");
		            var bg = real(ds_queue_dequeue(parts));
		            var tleft = real(ds_queue_dequeue(parts));
		            var ttop = real(ds_queue_dequeue(parts));
		            var tw_ = real(ds_queue_dequeue(parts));
		            var th_ = real(ds_queue_dequeue(parts));
		            tile_add(bg, tleft, ttop, tw_, th_, tx, ty, real(key));
		            key = ds_map_find_next(tiles_, key);
		        }
		    }
		}
	}

	var _layers = layer_get_all();
	var _numLayers = array_length_1d(_layers);
	
	for(var i = 0; i < _numLayers; i++) {
		
		var _layer = _layers[i];
		var _ld = layer_get_depth(_layer);
		
		if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
			
			var _tilemap = layer_tilemap_get_id(_layer);
		
			if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
				var _tileset = tilemap_get_tileset(_tilemap);
				var _width = tilemap_get_width(_tilemap);
				var _height = tilemap_get_height(_tilemap);
			
				if (_tileset > -1) {
				
					for (var j = 0; j < _width; j++) {
						for (var k = 0; k < _height; k++) {
						
							if tilemap_get(_tilemap, j, k) > 0 {
							
								var tid = tilemap_get(_tilemap, j, k);
								var tw = tilemap_get_tile_width(_tilemap);
								var th = tilemap_get_tile_height(_tilemap);
								var tx = j * tw;
								var ty = k * th;
								//show_debug_message("{0},{1}", j, k);
							
								var tbg = _tileset;
								var ti = tile_get_index(tid);
							
								var tile_id = string(tbg) + "," + string(ti);
								var tiles_ = ds_map_find_value(global.anims, tile_id);
								if(tiles_ > -1) {
									var key = ds_map_find_first(tiles_);
									while (!is_undefined(key)) {
										var tile = ds_map_find_value(tiles_, key);
										var tmx = tilemap_get_x(_tilemap);
										var tmy = tilemap_get_y(_tilemap);
										
										var oldKey = key;
										if _ld <= -1
											key = _ld + (_ld + key);
									
										var _layerToUse = -1;
										var _tilemapToUse = -1;
										var _layersAtDepth = layer_get_id_at_depth(key);
										var _numLayersAtDepth = array_length_1d(_layersAtDepth);
									
										for(var l = 0; l < _numLayersAtDepth; l++){
											var _lid = _layersAtDepth[l];
											
											if(layer_tilemap_exists(_lid, layer_tilemap_get_id(_lid))) {
												var _tmid = layer_tilemap_get_id(_lid);
										
												if(layer_get_element_type(_tmid) == layerelementtype_tilemap){
													var _tsid = tilemap_get_tileset(_tmid);
													if (_tsid == _tileset){
														_layerToUse = _lid;
														_tilemapToUse = _tmid;
														break;
													}
												}
											}
										}
									
										if (_layerToUse == -1) {
											_layerToUse = layer_create(key);
										}
										if (_tilemapToUse == -1) {
											_tilemapToUse = layer_tilemap_create(_layerToUse, tmx, tmy, _tileset, _width, _height);
										}
									
										var parts = split(tile, ",");
							            ds_queue_dequeue(parts);
							            var tid_ = real(ds_queue_dequeue(parts));										
										tilemap_set(_tilemapToUse, tid_, j, k);
										show_debug_message(key);
										key = ds_map_find_next(tiles_, oldKey);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	
}
