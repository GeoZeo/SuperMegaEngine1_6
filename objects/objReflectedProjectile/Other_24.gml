/// @description  Event: onHit - called when the projectile hits a target
if reflectible or contactDamage != 0
{
	if reflected or ((other.playHitSound and other.canPlayHitSound) && allowHitSound)
	{
		if ((other.playHitSound and other.canPlayHitSound) && allowHitSound)
		{
			if reflected
			{
				stopSFX(sfxReflect);
			}
		}
		else
		{
			stopSFX(sfxReflect);
		}
	}
}

