// FOR GLOBAL VALUES THAT NEED TO BE INITIALIZED BEFORE objGLobalControl IS MADE.
// USE ONLY IN rmINIT.

//Display variables
global.displayWidth = display_get_width();
global.displayHeight = display_get_height();

global.viewWidth = 256;
global.viewHeight = 224;

window_set_min_width(global.viewWidth);
window_set_min_height(global.viewHeight);

global.winWidthInit = 768;
global.winHeightInit = 672;

while (global.winWidthInit > global.displayWidth || global.winHeightInit > global.displayHeight)
&& (global.winWidthInit > global.viewWidth || global.winHeightInit > global.viewHeight)
{
	global.winWidthInit -= global.viewWidth;
	if global.winWidthInit <= global.viewWidth
		global.winWidthInit = global.viewWidth;
		
	global.winHeightInit -= global.viewHeight;
	if global.winHeightInit <= global.viewHeight
		global.winHeightInit = global.viewHeight;
}

global.winWidth = global.winWidthInit;
global.winHeight = global.winHeightInit;

window_set_size(global.winWidth, global.winHeight);

global.winX = window_get_x();
global.winY = window_get_y();

//Initialise screen scaling
application_surface_draw_enable(false);
toggleFullScreen( window_get_fullscreen() );

//Game language
//You can set the language by changing the number next to cfgLanguage in the macros script.
//Feel free to implement support for as many languages as you wish!
global.language = cfgLanguage; // 0 = Japanese, 1 (default) = English (US), etc...

global._maxHealth = cfgMaxHealth;
global.maxAmmo = cfgMaxAmmo;

//Input key variables.
global.enableSlideKey = cfgEnableSlideKey // Do we have an extra key dedicated to sliding?

//Option variables
global.enableDamageNumbers = cfgEnableDamageNumbers; //Show damage numbers.
global.enableCharge = cfgEnableCharge; //Can we charge the buster?
global.enableSlide = cfgEnableSlide; //Can we slide?
global.enableScrews = cfgEnableScrews; //Do screws exist in this game?
global.maxNumberOfBusterShots = cfgMaxNumberOfBusterShots;

global.frozen = true;

global.grav = cfgGravity;
global.gravWater = cfgGravityWater;

global.checkpoint = false;

global.eddieInstance = -1;

global.spriteStand = sprMegamanStand;
global.spriteBlink = sprMegamanStandBlink;
global.speedStand = 0;
global.spriteJump = sprMegamanJump;
global.speedJump = 0;

global.spriteLife = sprLife;
global.spriteStageSelect = sprMMStageSelect;
global.stageSelectFollow = true;
global.speedStageSelect = 0;

global.spriteShop = sprMegamanShop;
global.speedShop = 0;
global.shopX = 198;
global.shopY = 145;
global.shopXScale = -1;
global.shopYScale = 1;
global.shopNPC = objAuto;
global.shopBackground = bgShop;
global.shopBGM = bgmShop;
global.shopVolume = 0.9;
global.shopLoopStart = 0;
global.shopLoopEnd = 1;

global.jetSprite = sprRushJet;
global.jetSpeed = 0.25;

if cfgRememberLastMenuOption global.lastOption = 0;

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

global.character = -1;

global.initialStageClear = false;

//Weapons
global.charWeapons = ds_map_create();
with prtWeapon instance_destroy();
var weapon_index = 0;
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtWeapon) {
        global.weapons[weapon_index] = instance_create(0,0, i);
        global.weapons[weapon_index].ID = weapon_index;
        //Unlock for testing purposes. Remove the following line when distributing your game. NOTE: Also applies to the resetData() script.
        global.weapons[weapon_index].unlocked = true;
        
        weapon_index++;
    }
}

objPharaohShotWeapon.unlocked = false;  //Leave it locked for testing weapon get
//objRushJetWeapon.unlocked = false;  //Leave it locked for testing weapon get with utilities
objTimeSlowWeapon.unlocked = false;  //Leave it locked for testing plates

global.totalWeapons = array_length_1d(global.weapons);
global.weapons_per_col = ceil(global.totalWeapons / 2);

global.defaultWeapon = -1;

//Boss Names
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtBoss) {
        var boss = instance_create(0, 0, i);
		boss.cancelDestroyEvent = true;
        if boss.bossID > -1 {
            global.bossNames[boss.bossID] = boss.bossName;
            global.bosses[boss.bossID] = i;
        }
        with boss instance_destroy();
    }
}

//Initialize all bosses as undefeated (this is the correct behavior)
for(var i = 0; i < 8; i++) {
    global.bossDefeated[i] = false; 
    global.bossRushDefeated[i] = false; 
}

//While there are not other bosses, let's overwrite this for testing
//Comment the following lines when your game has 8 bosses
for(var i = 0; i < 8; i++) {
    global.bossDefeated[i] = true;  //All bosses are defeated
    global.bossRushDefeated[i] = true;  //All bosses are defeated
}
global.bossDefeated[7] = false; //We have only Pharaoh Man
global.bossRushDefeated[7] = false; //We have only Pharaoh Man

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

global.achievementQueue = [];

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

global.screen_border = cfgScreenBorder;
global.screen_borders[0] = noone;
global.screen_borders[1] = 1;
global.screen_borders[2] = 2;
global.screen_borders[3] = 3;
global.screen_borders[4] = 4;
global.num_screen_borders = array_length_1d(global.screen_borders);
global.current_screen_border = 1;

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

setPlayer(global.characters[cfgDefaultCharacter]);

instance_create(0, 0, objGlobalControl);
instance_destroy();

readTileObjects(); 
readTileAnimations();

print("Using ", iif(audio_system() == audio_old_system, "Old Audio System", "New Audio System")); 


