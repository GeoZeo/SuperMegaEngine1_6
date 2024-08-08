event_inherited();

name = "Proto Buster";
abbrev = "P.BUSTER";
maxshots = cfgMaxNumberOfBusterShots - 1;
chargeSFX = sfxProtoBusterCharging;
consumption = 0;
initChargeTime = 30; //The amount of frames after which to start charging after the shooting animation is complete
chargeTime = 57;

primaryCol = make_colour_rgb(222, 41, 0);
secondaryCol = make_colour_rgb(189, 189, 189);

outlineChargeCol1 = make_color_rgb(189, 0, 189);

chargeCol1 = make_color_rgb(247, 189, 57);
chargeCol2 = make_color_rgb(255, 231, 165);
outlineChargeCol2 = make_color_rgb(255, 115, 19);

for (var i = 0; i < global.totalCharacters; i++)
{
	if global.characters[i] != objProtoman
		ds_list_add(exceptCharacters, global.characters[i]);
}

