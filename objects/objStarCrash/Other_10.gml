/// @desc Stacked Collision
var _canHit = true;
var _destroy = false;
var _reflector = -1;

for (var i = 0; i < array_length_1d(enemyID); i++)
{
	if instance_exists(enemyID[i]) && enemyID[i].shieldCanTouch
	{
		with enemyID[i] {
			if (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
			&& (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
			&& (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
			&& (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
			    if dead == false && dying == false
			    {
			        if canHit == true
			        {
			            drawDamageNumber(x, y, damage[other.object_index]);
			            healthpoints -= damage[other.object_index];
			            if !object_is_ancestor(object_index, prtBoss) {
							if !hitWhite || healthpoints <= 0 visible = false;
							event_user(14);
						}
			        }
			        alarm[11] = flashTime;
					_destroy = true;
            
			        if _canHit
					{
						with other event_user(14);
						_canHit = false;
					}
					if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
            
			        check_enemy_death();
			    }
			}
			else
			{
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
	if instance_exists(shotID[i]) && shotID[i].shieldCanTouch
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
					if _canHit
					{
						with other event_user(14);
						_canHit = false;
					}
					event_user(14);
					_destroy = true;
					if !instance_exists(prtPlayer) or !prtPlayer.dead or !global.frozen
						if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
					
					if damageable
					{
						if explosionEffectShield instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
						instance_destroy();
					}
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
	if instance_exists(gimmickID[i]) && gimmickID[i].shieldCanTouch && gimmickID[i].canPlayerInteract
	{
		with gimmickID[i] {
			if sprite_index > -1 and (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
			&& (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
			&& (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
			&& (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
				if !dead && !dying { 
				    if damageable {
				        drawDamageNumber(x, y, damage[other.object_index]);
				        healthpoints -= damage[other.object_index];
				    }
				
					if !hitWhite || healthpoints <= 0 visible = false;
					if _canHit
					{
						with other event_user(14);
						_canHit = false;
					}
					event_user(1);
            
				    alarm[11] = flashTime;
					_destroy = true;
            
				    if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
				}
			}
			else if sprite_index > -1 and !dead && !dying {
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
	if instance_exists(solidID[i]) && solidID[i].shieldCanTouch && solidID[i].canPlayerInteract
	{
		with solidID[i] {
			if sprite_index > -1 and (!reflectProjectiles or other.pierceReflectors) && damage[other.object_index] != 0
			&& (!(reflectProjectilesLeft && sprite_get_xcenter_object(other.id) < sprite_get_xcenter()) or other.pierceReflectors)
			&& (!(reflectProjectilesRight && sprite_get_xcenter_object(other.id) > sprite_get_xcenter()) or other.pierceReflectors)
			&& (!useHitBox || collision_rectangle(x + hitbox_left * sign(image_xscale), y + hitbox_top, x + hitbox_right * sign(image_xscale), y + hitbox_bottom, other, false, true)) {
				if !dead && !dying {
				    if damageable {
				        drawDamageNumber(x, y, damage[other.object_index]);
				        healthpoints -= damage[other.object_index];
				    }
				
					if !hitWhite || healthpoints <= 0 visible = false;
					if _canHit
					{
						with other event_user(14);
						_canHit = false;
					}
					event_user(1);
            
				    alarm[11] = flashTime;
					_destroy = true;
            
				    if (playHitSound and canPlayHitSound) && other.allowHitSound playSFX(sfxEnemyHit);
				}
			}
			else if sprite_index > -1 and !dead && !dying {
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
	event_user(15);		
	instance_destroy();
}

