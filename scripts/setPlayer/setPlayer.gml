/// @description setPlayer(player): set the current player character
/// @param player
function setPlayer(argument0) {

	var player = argument0;
	if !object_exists(player) || argument0 == prtPlayer {
	    return false;
	}
	global.character = player;

	var char = instance_create(0, 0, player);

	global.name = char.charName;
	global.sprName = char.sprName;
	if global.defaultWeapon > -1 global.defaultWeapon.unlocked = false;
	global.defaultWeapon = char.defaultWeapon;
	global.spriteLife = char.spriteLife;
	global.spriteStageSelect = char.spriteStageSelect;
	global.stageSelectFollow = char.stageSelectFollow;
	global.spriteShopNPC = char.spriteShopNPC;
	global.shopBGM = char.shopBGM;
	global.shopVolume = char.shopBGMvolume;
	global.shopLoopStart = char.shopBGMloopStart;
	global.shopLoopEnd = char.shopBGMloopEnd;
	global.jetSprite = char.jetSprite;
	global.charPrimaryColor = char.primary_color;
	global.charSecondaryColor = char.secondary_color;
	global.spriteStand = asset_get_index("spr" + char.sprName + "Stand");
	global.spriteJump = asset_get_index("spr" + char.sprName + "Jump");
	global.blinkTimerMax = char.blinkTimerMax;
	global.blinkDuration = char.blinkDuration;
	global.src_col1 = char.src_col1;
	global.src_col2 = char.src_col2;
	global.src_col3 = char.src_col3;
	global.defaultWeapon.unlocked = true;


	with char instance_destroy();



}
