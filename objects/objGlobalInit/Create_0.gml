// FOR GLOBAL VALUES THAT NEED TO BE INITIALIZED BEFORE objGLobalControl IS MADE.
// USE ONLY IN rmINIT.

global._maxHealth = cfgMaxHealth;
global.maxAmmo = cfgMaxAmmo;

//Input key variables.
global.enableSlideKey = cfgEnableSlideKey // Do we have an extra key dedicted to sliding?

//Option variables
global.enableDamageNumbers = cfgEnableDamageNumbers; //Show damage numbers.
global.enableCharge = cfgEnableCharge; //Can we charge the buster?
global.enableSlide = cfgEnableSlide; //Can we slide?
global.enableScrews = cfgEnableScrews; //Do screws exist in this game?
global.maxNumberOfBusterShots = cfgMaxNumberOfBusterShots;

global.frozen = true;

global.checkpoint = false;

global.spriteLife = sprLife;
global.spriteStageSelect = sprMMStageSelect;
global.stageSelectFollow = true;

//Characters
var char_index = 0;
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtPlayer) {
        global.characters[char_index] = i;
        global.charIndices[i] = char_index;
        char_index++;
    }
}
global.totalCharacters = array_length_1d(global.characters);

//Weapons
global.charWeapons = ds_map_create();
with prtWeapon instance_destroy();
var weapon_index = 0;
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtWeapon) {
        global.weapons[weapon_index] = instance_create(0,0, i);
        global.weapons[weapon_index].ID = weapon_index;
        //Unlock for testing purposes. Remove the following line when distributing your game.
        global.weapons[weapon_index].unlocked = true;
        
        weapon_index++;
    }
}

//objPharaohShotWeapon.unlocked = false;  //Leave it locked for testing weapon get
objTimeSlowWeapon.unlocked = false;  //Leave it locked for testing plates

global.totalWeapons = array_length_1d(global.weapons);
global.weapons_per_col = ceil(global.totalWeapons / 2);

//Boss Names
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtBoss) {
        var boss = instance_create(0, 0, i);
        if boss.bossID > -1 {
            global.bossNames[boss.bossID] = boss.name;
            global.bosses[boss.bossID] = i;
        }
        with boss instance_destroy();
    }
}

//Initialize all bosses as undefeated (this is the correct behavior)
for(i = 0; i < 8; i++) {
    global.bossDefeated[i] = false; 
    global.bossRushDefeated[i] = false; 
}

//While there are not other bosses, let's overwrite this for testing
//Comment the following lines when your game has 8 bosses
for(i = 0; i < 8; i++) {
    global.bossDefeated[i] = true;  //All bosses are defeated
    global.bossRushDefeated[i] = true;  //All bosses are defeated
}
//global.bossDefeated[7] = false; //We have only Pharaoh Man
//global.bossRushDefeated[7] = false; //We have only Pharaoh Man

//Items
//Add all usable items before non-usable ones for correct placement in the pause menu
with prtEquip instance_destroy();
var item_index = 0;
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtEquip) and i != prtPlateEquip {
        global.items[item_index] = instance_create(0,0, i);
        item_index++;
    }
}

//Plates
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtPlateEquip) {
        global.items[item_index] = instance_create(0,0, i);
        item_index++;
    }
}

//Achievements
with prtAchievement instance_destroy();
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtAchievement) {
        instance_create(0,0, i);
    }
}

load_achievements();

global.damageMultiplier = 1;

global.fortressStarted = false;

global.screen_shader = cfgShader;

global.screen_shaders[0] = noone;
global.screen_shaders[1] = sh256;
global.screen_shaders[2] = sh64;
global.screen_shaders[3] = sh8;
global.screen_shaders[4] = shGB;
global.screen_shaders[5] = shGB2;
global.screen_shaders[6] = shGrayscale;
global.screen_shaders[7] = shBlueish;

global.num_screen_shaders = array_length_1d(global.screen_shaders);
global.current_screen_shader = 0;

global.passPlayVictory = false;
global.lastSave = 0;

global.GP = -1  //Gamepad

reset_controls();

load_configs();


//Initial and final layer for midground tile animations (decreasing)
global.ini_back_layer = 999999;
global.end_back_layer = 999920;


//Initial and final layer for foreground tile animations (decreasing)
global.ini_front_layer = -1000001;
global.end_front_layer = -1000080;


if cfgDebug || debug_mode {
    show_debug_overlay(true);
}

setPlayer(global.characters[1]);

instance_create(0, 0, objGlobalControl);
instance_destroy();

readTileObjects(); 
readTileAnimations();

print("Using ", iif(audio_system() == audio_old_system, "Old Audio System", "New Audio System")); 


