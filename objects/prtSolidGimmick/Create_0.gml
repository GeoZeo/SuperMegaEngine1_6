event_inherited();

dead = false;
dying = false;
spawnGrounded = false;
checkFullSprite = false;
canInitDeath = true;
canPlayerInteract = false; //Can the player actually touch or interact with this solid in any way?
playerCanTouch = true;
projCanTouch = false; //Can player/reflected enemy projectiles touch this solid?
shieldCanTouch = false;
beenOutsideView = false;
checkPlayerSpriteCenter = false;
playHitSound = false;
canPlayHitSound = true;

reflectProjectiles = true;
reflectProjectilesLeft = true;
reflectProjectilesRight = true;

useHitBox = false;
hitbox_left = bbox_left - x;
hitbox_right = bbox_right - x;
hitbox_top = bbox_top - y;
hitbox_bottom = bbox_bottom - y;

hitWhite = false; //Flicker white instead of transparent upon being hit?
isHit = false;
flashTime = 2;

damageable = false;

healthpointsStart = 1;
healthpoints = healthpointsStart;
update_rate = 1;

//Spawn area is how close we need to be for the enemy to spawn.
spawn_area_x1 = -1000000;
spawn_area_x2 = -1000000;
spawn_area_y1 = -1000000;
spawn_area_y2 = -1000000;

//Action area is how far away we can be from the spawn area before the enemy going off-screen results in it despawning.
action_area_x1 = -1000000;
action_area_x2 = -1000000;
action_area_y1 = -1000000;
action_area_y2 = -1000000;

//NOTE: You may need to set these areas instance-by-instance depending on the enemy type and proximity to a section border/scrolling block.

xspeed = 0;
yspeed = 0;
player_x = 0;
player_y = 0;

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

respawn = true; //Should we respawn after leaving the screen and entering it again?
neverDespawn = false; //Should we never despawn, even after leaving the screen?

