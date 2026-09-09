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
	global.speedStageSelect = char.speedStageSelect;
	global.spriteShop = char.spriteShop;
	global.speedShop = char.speedShop;
	global.shopX = char.shopX;
	global.shopY = char.shopY;
	global.shopXScale = char.shopXScale;
	global.shopYScale = char.shopYScale;
	global.shopNPC = char.shopNPC;
	global.shopBackground = char.shopBackground;
	global.shopBGM = char.shopBGM;
	global.shopVolume = char.shopBGMvolume;
	global.shopLoopStart = char.shopBGMloopStart;
	global.shopLoopEnd = char.shopBGMloopEnd;
	global.jetSprite = char.jetSprite;
	global.jetSpeed = char.jetSpeed;
	global.charPrimaryColor = char.primary_color;
	global.charSecondaryColor = char.secondary_color;
	global.spriteStand = asset_get_index("spr" + char.sprName + "Stand");
	global.speedStand = char.speedStandDefault;
	
	if asset_get_index("spr" + char.sprName + "StandBlink") > -1
		global.spriteBlink = asset_get_index("spr" + char.sprName + "StandBlink");
	else
		global.spriteBlink = -1;
		
	global.spriteJump = asset_get_index("spr" + char.sprName + "Jump");
	global.speedJump = char.speedJump;
	global.blinkTimerMax = char.blinkTimerMax;
	global.blinkDuration = char.blinkDuration;
	global.src_col1 = char.src_col1;
	global.src_col2 = char.src_col2;
	global.src_col3 = char.src_col3;
	global.defaultWeapon.unlocked = true;


	with char instance_destroy();



}
