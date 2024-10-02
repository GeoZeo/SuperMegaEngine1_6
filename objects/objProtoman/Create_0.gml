event_inherited();

charName = "Proto Man";
sprName = "Protoman";

enableSlide = true;
enableCharge = true;

damageMultiplier = 2;
knockbackAmount = cfgKnockback * 2;

//Static sprites
spriteSlide = sprProtomanSlide;
spriteHit = sprProtomanHit;
spriteStun = sprProtomanStun;
spriteTeleport = sprProtomanTeleport;

spriteLife = sprProtomanLife;
spriteStageSelect = sprPMStageSelect;
stageSelectFollow = false;
spriteShopNPC = spr5QuestionMarks;

//Sprite animation speeds
speedStandDefault = 0.15;
speedStepDefault = 0.15;
speedSlide = 1/6;

blinkTimerMax = 6;
blinkDuration = 6;

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

