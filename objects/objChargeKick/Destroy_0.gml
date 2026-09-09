with prtPlayer
{
	//if invincibilityTimer <= 0
	//{
	//	canHit = true;
	//}
	
	if objChargeKickWeapon.ammo <= 0
	{
		if asset_get_index("spr" + global.character.sprName + "Slide") > -1
		{
			spriteSlide = asset_get_index("spr" + global.character.sprName + "Slide");
		}
	}
}

