event_inherited();

switch global.language {
	case 0: charName = "Blues"; break; //Japanese
	case 1: charName = "Proto Man"; break; //English (US)
	//Add cases for 2, 3, etc. when you add more languages
	default: charName = "Proto Man"; break; //Default: English (US)
								
}
	
sprName = "Protoman";

enableSlide = true;
enableCharge = true;
enableDash = false;

dust_xoffset = 11;

damageMultiplier = 2;
knockbackAmount = cfgKnockback * 2;

//Static sprites
spriteSlide = sprProtomanSlide;
spriteHit = sprProtomanHit;
spriteStun = sprProtomanStun;
spriteTeleport = sprProtomanTeleport;

spriteShop = sprProtomanShop;
spriteLife = sprProtomanLife;
spriteStageSelect = sprPMStageSelect;
stageSelectFollow = false;
speedStageSelect = 0.5;
shopNPC = obj5QuestionMarks;
shopBackground = bgProtomanShop;

//Sprite animation speeds
speedStandDefault = 1/9;
speedStepDefault = 1/9;
speedSlide = 0.25;
speedShop = 1/12;

blinkTimerMax = 0;
blinkDuration = 0;

reflector_x = 14; 
reflector_y = 2;
reflector_width = 6;
reflector_height = 19;
reflector_left_offset = true;

shoot_height = 7;
shoot_shift = 0;
jump_shoot_height = 6;

primary_color = make_colour_rgb(222, 41, 0);
secondary_color = make_colour_rgb(189, 189, 189);
src_col1 = primary_color;
src_col2 = make_colour_rgb(173, 0, 16);
src_col3 = secondary_color;

jingle = sfxWhistle;

jetSprite = sprProtoJet;

shopBGM = bgmProtomanShop;
shopBGMvolume = 0.9;
shopBGMloopStart = 1.74/43.73;
shopBGMloopEnd = 23.15/43.73;

defaultWeapon = objProtoBusterWeapon;

