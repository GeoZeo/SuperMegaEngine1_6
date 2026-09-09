/// @description  onSelect
if ammo > 0
{
	with prtPlayer
	{
		if asset_get_index("spr" + global.character.sprName + "ChargeKick") > -1
		{
			spriteSlide = asset_get_index("spr" + global.character.sprName + "ChargeKick");
		}
	}
}

