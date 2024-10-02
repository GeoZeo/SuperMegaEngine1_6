var max_saves = 9;

var map;

for (var i = 0; i < max_saves; i++) {
    map  = ds_map_secure_load("save" + string(i) + ".dat");
    saves[i] = map;
}

num_saves = array_length_1d(saves);

selected = global.lastSave;

surePhase = false;
isSure = false;

currentChar = global.character;

