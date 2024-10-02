event_inherited();

wpnName = "MEGA BUSTER";
abbrev = "M.BUSTER";
consumption = 0;
initChargeTime = 20; //The amount of frames after which to start charging after the shooting animation is complete
chargeTime = 57;
maxshots = cfgMaxNumberOfBusterShots;

primaryCol = make_color_rgb(0, 120, 248);
secondaryCol = make_color_rgb(0, 232, 216);

outlineChargeCol1 = make_color_rgb(168, 0, 32);
outlineChargeCol2 = make_color_rgb(228, 0, 88);
outlineChargeCol3 = make_color_rgb(248, 88, 152);

chargeCol1 = make_color_rgb(0, 232, 216);
chargeCol2 = make_color_rgb(0, 120, 248);

for (var i = 0; i < global.totalCharacters; i++)
{
	if global.characters[i] != objMegaman
		ds_list_add(exceptCharacters, global.characters[i]);
}

