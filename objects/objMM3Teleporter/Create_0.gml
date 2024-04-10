for (var i = 0; i <= 48; i += 48) {
	for (var j = 0; j <= 16; j += 16) {
		var mySolid = instance_create(x+j, y+i, objSolid);
	}
}

var _layer = -1;
var _layers = layer_get_id_at_depth(-1000000);
var _numLayers = array_length(_layers);

for (var i = 0; i < _numLayers; i++) {
	var _a = layer_get_all_elements(_layers[i]);
	var _numA = array_length(_a);
	for (var j = 0; j < _numA; j++) {
		if layer_get_element_type(_a[j]) == layerelementtype_sprite {
			_layer = _layers[i];
		}
	}
}

if _layer = -1
	_layer = layer_create(-1000000);
	
layer_sprite_create(_layer, x, y+16, sprMM3TeleporterGlass);

