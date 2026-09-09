/// @description  Event: onHit - called when the projectile hits a target
// To be defined in child objects if necessary
if reflectible or other.damage[object_index] != 0
{
	if (reflected and !destroyOnReflect) or ((other.playHitSound and other.canPlayHitSound) && allowHitSound)
	{
		if ((other.playHitSound and other.canPlayHitSound) && allowHitSound)
		{
			if (!reflected or !destroyOnReflect)
			{
				stopSFX(global.weapons[global.currentWeapon].sfx);
			}
		}
		else
		{
			if (reflected and !destroyOnReflect)
			{
				stopSFX(global.weapons[global.currentWeapon].sfx);
			}
		}
	}
}

