dead = false;
canInitDeath = true;
beenOutsideView = false;
outsideSection = false; //Has this enemy just moved outside of a section?
checkFullSprite = false; //Should we check whether the whole sprite is in view instead of just the center to see if this enemy is on-screen or not?
canSpawnItem = true;
canHit = true;
xspeed = 0;
yspeed = 0;

update_rate = 1;

healthpointsStart = 1;
healthpoints = healthpointsStart;
contactDamage = 1;

//Reflection
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left

//Spawn the radii that determine whether or not the enemy should be despawned if it moves off-screen on its own.
//NOTE: Not all enemies need these! Therefore, they are null by default.
//Use these only if you don't want an enemy to despawn if they move off-screen on their own.

//Spawn area is how close we need to be for the enemy to spawn.
mySpawnArea = noone;

//Action area is how far away we can be from the spawn area before the enemy going off-screen results in it despawning.
myActionArea = noone;

//NOTE: You may need to set the positions and scales of these radii instance-by-instance depending on the enemy type and proximity to a section border/scrolling block.

respawn = true; //Should we respawn after leaving the screen and entering it again?
neverDespawn = false;

targetable = true;  //For Hornet Chaser and other homing weapons

useHitBox = false;
hitbox_left = bbox_left - x;
hitbox_right = bbox_right - x;
hitbox_top = bbox_top - y;
hitbox_bottom = bbox_bottom - y;

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
instance_activate_object(prtPlayer); //This fixes a glitch where the create event triggering while the player is colliding with an enemy/projectile/hazard/etc. causes the player to be hit even when they're supposed to be in the middle of i-frames.

