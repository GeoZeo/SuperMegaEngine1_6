/// @description  readTileAnimations
function readTileAnimations() {
	// Must be called from rmInit

	global.anims = ds_map_create();
	global.anims2 = ds_map_create();

	var tiles = tile_get_ids();
	var num_tiles = array_length_1d(tiles);

	for (var i = 0; i < num_tiles; i++) {
		if tiles[i] > -1 {
		    var tid = tiles[i];
		    var tl = tile_get_depth(tid);
		    if tl == 1000000 {
		        continue;
		    }
		    var tx = tile_get_x(tid);
		    var ty = tile_get_y(tid);
		    var tw = tile_get_width(tid);
		    var th = tile_get_height(tid);
		    var tile_id = tile_get_type(tid, 0, 0);
		    for (var j = 0; j < num_tiles; j++) {
				if tiles[j] > -1 {
			        var tid_ = tiles[j];
			        var tl_ = tile_get_depth(tid_);
			        if tl_ != 1000000 {
			            continue;
			        }        
			        var tx_ = tile_get_x(tid_);
			        var ty_ = tile_get_y(tid_);
			        var tw_ = tile_get_width(tid_);
			        var th_ = tile_get_height(tid_);
			        if tx > tx_ + tw_ or ty > ty_ + th_ or tx < tx_ or ty < ty_ {
			            continue;
			        }
			        var tile_id_ = tile_get_type(tid_, tx - tx_, ty - ty_);
			        //print(tile_id, tile_id_, tx, tx_, ty, ty_);
			        var anim = ds_map_find_value(global.anims2, tile_id_);
			        if is_undefined(anim) {
			            anim = ds_map_create();
			        }
			        ds_map_add(anim, tl, tile_id + "," + string(tw) + "," + string(th));
			        ds_map_add(global.anims2, tile_id_, anim);
				}
		    }
		}
	}

	var _layers = layer_get_all();
	var _numLayers = array_length(_layers);
	
	for(var i = 0; i < _numLayers; i++) {
		
		var _layer = _layers[i];
		
		if (layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
			
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
								var td = layer_get_depth(_layer);
								if(td == 1000000) {
									continue;
								}
								var tw = tilemap_get_tile_width(_tilemap);
								var th = tilemap_get_tile_height(_tilemap);
								var tx = j * tw;
								var ty = k * th;
							
								var tbg = _tileset;
								var ti = tile_get_index(tid);
							
								var tile_id = string(tbg) + "," + string(tid);
								//show_debug_message("Layer I: {0}", td);
								for(var l = 0; l < _numLayers; l++) {
		
									var __layer = _layers[l];
									
									if(layer_tilemap_exists(__layer, layer_tilemap_get_id(__layer))) {
									
										var __tilemap = layer_tilemap_get_id(__layer);
		
										if(layer_get_element_type(__tilemap) == layerelementtype_tilemap) {
											var __tileset = tilemap_get_tileset(__tilemap);
											var __width = tilemap_get_width(__tilemap);
											var __height = tilemap_get_height(__tilemap);
			
											if (__tileset > -1) {
				
												for (var m = 0; m < __width; m++) {
													for (var n = 0; n < __height; n++) {
									
														if tilemap_get(__tilemap, m, n) > 0 {
										
															var tid_ = tilemap_get(__tilemap, m, n);
															var td_ = layer_get_depth(__layer);
															if(td_ != 1000000) {
																continue;
															}
															var tw_ = tilemap_get_tile_width(__tilemap);
															var th_ = tilemap_get_tile_height(__tilemap);
															var tx_ = m * tw_;
															var ty_ = n * th_;
															if tx != tx_ or ty != ty_ {
																continue;
															}
										
															var tbg_ = __tileset;
															var ti_ = tile_get_index(tid_);
										
															var tile_id_ = string(tbg_) + "," + string(ti_);
															print(tile_id, tile_id_, tx, tx_, ty, ty_);
										
															var anim = ds_map_find_value(global.anims, tile_id_);
															if is_undefined(anim){
																anim = ds_map_create();
															}
															ds_map_add(anim, td, tile_id);
															ds_map_add(global.anims, tile_id_, anim);
															//show_debug_message("Layer J: {0}", td_);
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
				}
			}
		}
	}




}
