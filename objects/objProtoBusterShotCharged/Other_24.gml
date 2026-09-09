/// @description OnHit - to be inherited
if reflectible or other.damage[object_index] != 0
{
	if (reflected and !destroyOnReflect) or ((other.playHitSound and other.canPlayHitSound) && allowHitSound)
	{
		if ((other.playHitSound and other.canPlayHitSound) && allowHitSound)
		{
			if !reflected or !destroyOnReflect
			{
				stopSFX(sfxProtoBusterCharged);
			}
		}
		else
		{
			if reflected and !destroyOnReflect
			{
				stopSFX(sfxProtoBusterCharged);
			}
		}
	}
}