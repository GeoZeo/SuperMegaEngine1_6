event_inherited();

switch global.language {
	case 0: charName = "Rockman"; break; //Japanese
	case 1: charName = "Mega Man"; break; //English (US)
	//Add cases for 2, 3, etc. when you add more languages
	default: charName = "Mega Man"; break; //Default: English (US)
								
}
	
sprName = "Megaman";

enableSlide = cfgEnableSlide;
enableCharge = cfgEnableCharge;
//enableDash = true;

//Static sprites
spriteSlide = sprMegamanSlide;
spriteHit = sprMegamanHit;
spriteStun = sprMegamanStun;
spriteTeleport = sprMegamanTeleport;
spriteDash = sprMegamanDash;
//spriteLand = sprMegamanLand;
//spriteAbsorbTransition = sprMegamanAbsorbTransition;
//spriteAbsorb = sprMegamanAbsorb;

//speedLand = 1;
//speedAbsorbTransition = 1;
//speedAbsorb = 0;

