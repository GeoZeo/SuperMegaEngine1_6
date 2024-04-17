event_inherited();

for (var i = 0; i <= 48; i += 48) {
	for (var j = 0; j <= 16; j += 16) {
		var mySolid = instance_create(init_x+j, init_y+i, objSolid);
	}
}

layer_sprite_create(_back_layer, init_x, init_y, sprMM3Teleporter);
layer_sprite_create(_front_layer, init_x, init_y+16, sprMM3TeleporterGlass);

