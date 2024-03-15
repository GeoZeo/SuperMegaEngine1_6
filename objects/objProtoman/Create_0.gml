event_inherited();

name = "Proto Man";
sprName = "Protoman";

enableSlide = true;
enableCharge = true;

damageMultiplier = 2;
knockbackAmount = cfgKnockback * 2;

//Static sprites
spriteSlide = sprProtomanSlide;
spriteHit = sprProtomanHit;
spriteTeleport = sprProtomanTeleport;

spriteLife = sprProtomanLife;
spriteStageSelect = sprPMStageSelect;
stageSelectFollow = false;

//Sprite animation speeds
speedStandDefault = 0.15;
speedStepDefault = 0.15;
speedSlide = 1/6;

blinkTimerMax = 6;
blinkDuration = 6;

shoot_height = 7;
shoot_shift = 0;
jump_shoot_height = 6;

primary_color = make_colour_rgb(222, 41, 0);
secondary_color = make_colour_rgb(189, 189, 189);
src_col1 = primary_color;
src_col2 = make_colour_rgb(173, 0, 16);
src_col3 = secondary_color;

jingle = sfxWhistle;

defaultWeapon = objProtoBusterWeapon;

