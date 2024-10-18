var max_saves = 9;

var map;

for (var i = 0; i < max_saves; i++) {
    map = ds_map_secure_load("save" + string(i) + ".dat");
    saves[i] = map;
}

num_saves = array_length_1d(saves);

selected = 0;

primed_index = -1;
primed_map = -1;

actions[0] = "LOAD";
actions[1] = "MOVE";
actions[2] = "COPY";
actions[3] = "DEL.";

action_index = 0;

surePhase = false;
isSure = false;

row = 0;

cursorTimer = 0;
arrowTimer = 0;

map = saves[selected];
if map > -1 and ds_map_exists(map, "character") {
    setPlayer(map[? "character"]);
}

//For auto-shifting through the options in the menu
//Horizontal
h_as_delay = 25;
h_as_rate = 5;
h_as_init_timer = h_as_delay;
h_as_timer = h_as_rate;

//Vertical
v_as_delay = 25;
v_as_rate = 5;
v_as_init_timer = v_as_delay;
v_as_timer = v_as_rate;


