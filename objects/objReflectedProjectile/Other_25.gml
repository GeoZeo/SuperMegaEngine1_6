/// @description  Event: onDestroy - called when the projectile is destroyed
if !reflected
{
	if explosionEffect
		instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
}
