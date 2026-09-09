if cfgEnableProjectileCollisionStacking return false;

if !other.projCanTouch return false;

with other
{
	if sprite_index > -1 and (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
	&& (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
	&& (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
	{
		if other.sprite_index > -1 and (!other.reflectProjectiles or pierceReflectors) && contactDamage != 0
		&& (!(other.reflectProjectilesLeft && sprite_get_xcenter() < sprite_get_xcenter_object(other.id)) or pierceReflectors)
		&& (!(other.reflectProjectilesRight && sprite_get_xcenter() > sprite_get_xcenter_object(other.id)) or pierceReflectors)
		{
			with other event_user(14);
			with other event_user(2);
			event_user(14);
			
			//if !instance_exists(prtPlayer) or !prtPlayer.dead or !global.frozen
			//	if playHitSound playSFX(sfxEnemyHit);
		}
		else if other.sprite_index > -1
		{
			with other
			{
				other.reflected = true;
				event_user(1);
			}
		}
	}
	else if sprite_index > -1
	{
		other.reflected = true;
		with other event_user(14);
		with other event_user(15);
        event_user(0); //Reflect the projectiles
					
		event_user(14);
	}
}

