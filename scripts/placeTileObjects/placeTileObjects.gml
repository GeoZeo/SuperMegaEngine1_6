/// @description  placeTileObjects()
function placeTileObjects() {

	var _layers = layer_get_id_at_depth(1000000);
	var _numLayers = array_length(_layers);
	for(var i = 0; i < _numLayers; i++) {
		
		if(layer_tilemap_exists(_layers[i], layer_tilemap_get_id(_layers[i]))) {
		
			var _tilemap = layer_tilemap_get_id(_layers[i]);

			if(layer_get_element_type(_tilemap) == layerelementtype_tilemap) {
				var _tileset = tilemap_get_tileset(_tilemap);
				var _width = tilemap_get_width(_tilemap);
				var _height = tilemap_get_height(_tilemap);
		
				if (_tileset > -1) {
			
					for (var j = 0; j < _width; j++) {
						for (var k = 0; k < _height; k++) {
					
							if tilemap_get(_tilemap, j, k) > 0 {
								//show_debug_message("Tile: {0}", tilemap_get(_tilemap, j, k));
						
								var tid = tilemap_get(_tilemap, j, k);
						
								var tw = tilemap_get_tile_width(_tilemap);
								var th = tilemap_get_tile_height(_tilemap);
								var tx = j * tw;
								var ty = k * th;
						
								var tbg = _tileset;
								var ti = tile_get_index(tid);
						
								var type = string(tbg) + "," + string(ti);
								//show_debug_message("Type: {0}", type);
						
								var obj = ds_map_find_value(global.tiles, type);
							    if !is_undefined(obj) {
							        var inst = instance_create(tx, ty, obj);
									
									inst.image_xscale = tw / inst.sprite_width;
									inst.image_yscale = th / inst.sprite_height;
									
									//if obj != objTopSolid {
									//	inst.image_yscale = th / inst.sprite_height;
									//}
									//else {
									//	inst.image_yscale = (th / inst.sprite_height) / 16;
									//}
						
								}
							}
						}
					}
				}
			}
	
			//var i = 1;
			//repeat 6 {
			//	show_debug_message("{0} count: {1}", object_get_name(i), instance_number(i));
			//	i++;
			//}
		}
	}


}
