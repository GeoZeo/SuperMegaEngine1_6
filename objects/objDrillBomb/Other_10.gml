/// @desc Stacked Collision
var _canHit = true;
var _destroy = false;
var _reflector = -1;

for (var i = 0; i < array_length_1d(enemyID); i++)
{
	if instance_exists(enemyID[i]) && enemyID[i].projCanTouch
	{
		with enemyID[i] {
			if (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
		    && (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
		    && (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
		    && (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
		        if !dead && !dying {
		            if canHit {
		                _destroy = true;
						if _canHit
						{
							with other event_user(14);
							_canHit = false;
						}
		                event_user(14);
		            }
		            alarm[11] = flashTime;            
		            if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);            
		        }
		    }
		    else if !dead && !dying {
		        if _reflector == -1
					_reflector = self;
					
				if _canHit
				{
					with other event_user(14);
					_canHit = false;
				}
		    }
		}
	}
}

for (var i = 0; i < array_length_1d(shotID); i++)
{
	if instance_exists(shotID[i]) && shotID[i].projCanTouch
	{
		with shotID[i]
		{
			if sprite_index > -1 and (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
			&& (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
			&& (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
			{
				if other.sprite_index > -1 and (!other.reflectProjectiles or pierceReflectors) && contactDamage != 0
				&& (!(other.reflectProjectilesLeft && sprite_get_xcenter() < sprite_get_xcenter_object(other.id)) or pierceReflectors)
				&& (!(other.reflectProjectilesRight && sprite_get_xcenter() > sprite_get_xcenter_object(other.id)) or pierceReflectors)
				{
					_destroy = true;
					if _canHit
					{
						with other event_user(14);
						_canHit = false;
					}
					event_user(14);
					if !instance_exists(prtPlayer) or !prtPlayer.dead or !global.frozen
						if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
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
				if _reflector == -1
					_reflector = self;
					
				if _canHit
				{
					with other event_user(14);
					_canHit = false;
				}
				event_user(14);
			}
		}
	}
}

for (var i = 0; i < array_length_1d(gimmickID); i++)
{
	if instance_exists(gimmickID[i]) && gimmickID[i].projCanTouch && gimmickID[i].canPlayerInteract
	{
		with gimmickID[i] {
			if (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
			&& (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
			&& (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
			&& (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
				if !dead && !dying { 
					_destroy = true;
					if _canHit
					{
						with other event_user(14);
						_canHit = false;
					}
					event_user(1);
				    alarm[11] = flashTime;
					if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
				}
			}
			else if !dead && !dying {
				if _reflector == -1
					_reflector = self;
				
				if _canHit
				{
					with other event_user(14);
					_canHit = false;
				}
				event_user(1);
			}
		}
	}
}

for (var i = 0; i < array_length_1d(solidID); i++)
{
	if instance_exists(solidID[i]) && solidID[i].projCanTouch && solidID[i].canPlayerInteract
	{
		with solidID[i] {
			if (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
			&& (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
			&& (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
			&& (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
				if !dead && !dying {
				    _destroy = true;
					if _canHit
					{
						with other event_user(14);
						_canHit = false;
					}
					event_user(1);
				    alarm[11] = flashTime;
					if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
				}
			}
			else if !dead && !dying {
				if _reflector == -1
					_reflector = self;
				
				if _canHit
				{
					with other event_user(14);
					_canHit = false;
				}
				event_user(1);
			}
		}
	}
}

if _reflector != -1
{
	stopSFX(sfxDrillBomb);
	with _reflector
	{
		other.reflected = true;
		with other event_user(15);
		event_user(0); //Reflect the projectiles
	}
}

array_delete(enemyID, 0, array_length_1d(enemyID) - 1);
array_delete(shotID, 0, array_length_1d(shotID) - 1);
array_delete(gimmickID, 0, array_length_1d(gimmickID) - 1);
array_delete(solidID, 0, array_length_1d(solidID) - 1);

if _destroy
{
	event_user(2);
}

