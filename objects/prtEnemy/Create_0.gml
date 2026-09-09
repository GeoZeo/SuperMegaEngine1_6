dead = false;
dying = false; //In the middle of a death animation?
spawnGrounded = false;
deathChecked = false;
canInitDeath = true;
beenOutsideView = false;
checkFullSprite = false; //Should we check whether the whole sprite is in view instead of just the center to see if this enemy is on-screen or not?
canSpawnItem = true;
instantItemSpawn = false; //Spawn item instantly upon death (like in MM2) instead of on a timer?
canHit = true;
resetIgnore = true; //Remove self from projectile ignore lists on a 2-frame timer?
playHitSound = true;
canPlayHitSound = true;
playerCanTouch = true;
projCanTouch = true; //Whether projectiles touch us or pass through us
shieldCanTouch = true;
inWater = false; //Currently underwater?
canSplash = true;
grav = global.grav;
gravWater = global.gravWater;
currentGrav = grav;
xspeed = 0;
yspeed = 0;
player_x = 0;
player_y = 0;
checkPlayerSpriteCenter = false;
 
update_rate = 1;

healthpointsStart = 1;
healthpoints = healthpointsStart;
contactDamage = 1;

hitWhite = false; //Flicker white instead of transparent upon being hit?
flashTime = 2; 

//Reflection
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left

//Below are the areas that determine whether or not the enemy should be despawned if it moves off-screen on its own.
//NOTE: Not all enemies need these! Therefore, they are noone by default.
//Use these only if you don't want an enemy to despawn if they move off-screen on their own.

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

respawn = true; //Should we respawn after leaving the screen and entering it again?
neverDespawn = false;

targetable = true;  //For Hornet Chaser and other homing weapons
targetedBy = -1;

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
if (!instance_exists(objBeat) or !objBeat.target_found) instance_activate_object(prtPlayer); //This fixes a glitch where the create event triggering while the player is colliding with an enemy/projectile/hazard/etc. causes the player to be hit even when they're supposed to be in the middle of i-frames.

col = 0; //0 = red; 1 = orange; 2 = blue; etc... Mainly used for certain MM1 enemies

