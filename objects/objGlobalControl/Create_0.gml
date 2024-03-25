if global.screen_shader != noone {
    application_surface_draw_enable(false);
}

event_perform(ev_step_begin, 0); //Registers the key inputs

//Variables
global._health = global._maxHealth;
global.weapon = 0;  //Can have values like megabuster, silvertomahawk etc for all weapons in the game, even those that are not on the pause menu
global.currentWeapon = 0;   //Only the weapons used in the level; only those that are on the pause menu

global.font = font_add_sprite(sprFont, ord("!"), true, 0);
global.MM3font = font_add_sprite(sprMM3Font, ord("!"), true, 0);

global.frozen = false;
global.switchingSection = false;
global.currentPickupID = 0; //Each pickup (health, weapon energy, life, tanks) has an ID
                            //This way, we can make it despawn when the room starts if the pickup has already been collected in that level

//Go to the next room if this is the initializing room
//Also, initialize some variables
if room == rmInit {

    global.bgm = -1;
	global.bgmIndex = -1;
    global.loopStart = -1;
    global.loopEnd = -1;
	global.volume = -1;
	global.length = -1;
    
    display_reset(0, true); //Enables V-synch to make everything look nicer (without V-sync, GM Studio games tend to look pretty bad)
    stopAllSFX();
        
    // Max values for several vitals.
    global.maxScrews = 999;
        
    room_goto(initialRoom); //initialRoom is defined in Macros
    global._lives = 2;
    global.screws = 0;
       
    var i;
    for(i = 0; i < 1000; i++) { //If you somehow have over 1000 pickups in one room, increase this number
        global.pickupCollected[i] = false;
    }
    
    global.lastRoom = rmInit;
    global.checkpoint = false;
    global.checkpointX = 0;
    global.checkpointY = 0;
    global.levelStart = false;
    
    global.primaryCol = c_white;
    global.secondaryCol = c_white;
    global.outlineCol = c_black;
    
    for(i = 0; i < global.totalWeapons; i++) {
        global.ammo[i] = global.maxAmmo;
    }
    
    application_surface_draw_enable(true);
}

//Hide tiles/tile animation frames at start
curr_backLayer = global.ini_backLayer;
validBackLayers = array_create(0);
for (var l = global.ini_backLayer; l >= global.end_backLayer; l--) {
    
	var _layers = layer_get_id_at_depth(l);
	var _numLayers = array_length(_layers);

	for(var i = 0; i < _numLayers; i++) {
		var _layer = _layers[i];
		
		if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
			
			array_push(validBackLayers, _layer);
			
			var _tilemap = layer_tilemap_get_id(_layer);
		
			if(layer_get_element_type(_tilemap) == layerelementtype_tilemap)
				layer_set_visible(_layer, false);
		}
	}
	tile_layer_hide(l);
}

curr_frontLayer = global.ini_frontLayer;
validFrontLayers = array_create(0);
for (var l = global.ini_frontLayer; l >= global.end_frontLayer; l--) {
    
	var _layers = layer_get_id_at_depth(l);
	var _numLayers = array_length(_layers);

	for(var i = 0; i < _numLayers; i++) {
		var _layer = _layers[i];
		
		if(layer_tilemap_exists(_layer, layer_tilemap_get_id(_layer))) {
			
			array_push(validFrontLayers, _layer);
			
			var _tilemap = layer_tilemap_get_id(_layer);
		
			if(layer_get_element_type(_tilemap) == layerelementtype_tilemap)
				layer_set_visible(_layer, false);
		}
	}
	tile_layer_hide(l);
}

cameraXOffset = 0;
cameraYOffset = 0;

//When the level starts, all pickups should spawn
if global.levelStart {
    event_user(0);
    alarm[0] = 1;
}

