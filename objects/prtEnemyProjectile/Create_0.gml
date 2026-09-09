xspeed = 0;
yspeed = 0;
player_x = 0;
player_y = 0;
checkPlayerSpriteCenter = false;
contactDamage = 1;
update_rate = 1;
reflected = false;
reflectible = true;
healthpoints = 1;
damageable = true;
pierceReflectors = false;
playHitSound = false;
canPlayHitSound = true;

//Reflection
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left

destroyOnReflect = false;
playerCanTouch = true;
projCanTouch = false;
shieldCanTouch = true;
explosionEffectShield = false;
explosionEffectReflect = false;

//Default damage
var oldFrozen = global.frozen;
	
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtPlayerProjectile) and i != prtShieldWeapon {
        instance_deactivate_object(prtPlayer);
		global.frozen = true;
        var proj = instance_create(0, 0, i);
        //print(i, proj, object_get_name(i), proj.defaultDamage, proj.defaultBossDamage, global.frozen);
        damage[i] = proj.defaultDamage;
        with proj instance_destroy();
        //print("depois", i, global.frozen);
    }
}
global.frozen = oldFrozen;
if (!instance_exists(objBeat) or !objBeat.target_found) instance_activate_object(prtPlayer); //This fixes a glitch where the create event triggering while the player is colliding with an enemy/projectile/hazard/etc. causes the player to be hit even when they're supposed to be in the middle of i-frames.

col = 0; //0 = red; 1 = orange; 2 = blue; etc... Mainly used for certain MM1 projectiles

