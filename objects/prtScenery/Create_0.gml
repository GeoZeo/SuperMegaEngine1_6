init_x = x;
init_y = y;

sprite_index = -1;

_front_layer = -1;

var _front_depth = global.end_front_layer - 1;
var _front_layers = layer_get_id_at_depth(_front_depth);
var _num_front_layers = array_length_1d(_front_layers);

for (var i = 0; i < _num_front_layers; i++) {
	var _a = layer_get_all_elements(_front_layers[i]);
	var _num_a = array_length_1d(_a);
	for (var j = 0; j < _num_a; j++) {
		if layer_get_element_type(_a[j]) == layerelementtype_sprite {
			_front_layer = _front_layers[i];
		}
	}
}

if _front_layer = -1
	_front_layer = layer_create(_front_depth);
	
	
_back_layer = -1;

var _back_depth = global.end_back_layer - 1;
var _back_layers = layer_get_id_at_depth(_back_depth);
var _num_back_layers = array_length_1d(_back_layers);

for (var i = 0; i < _num_back_layers; i++) {
	var _a = layer_get_all_elements(_back_layers[i]);
	var _num_a = array_length_1d(_a);
	for (var j = 0; j < _num_a; j++) {
		if layer_get_element_type(_a[j]) == layerelementtype_sprite {
			_back_layer = _back_layers[i];
		}
	}
}

if _back_layer = -1
	_back_layer = layer_create(_back_depth);
	
	