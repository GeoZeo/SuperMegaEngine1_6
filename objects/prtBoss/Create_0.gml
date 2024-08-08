event_inherited();

//Boss Info (for stage select and intro)
name = "";
level = noone;
introBGCol = noone;
introLineCol = noone;
standSprite = noone;
pose = -1;
poseImgSpeed = 3/60;
weaponID = -1;
utilityID = -1;
bossID = -1;

//Do we always have to fight this boss even if it's already been beaten once?
bPersistent = true;

control = -1;

//Initialization variables, don't change
global.weaponID = weaponID;
global.utilityID = utilityID;
global.bossID = bossID;

startIntro = false;
isIntro = false;
startFight = false;
isFight = false;

xspeed = 0;
yspeed = 0;
image_xscale = -1;
image_speed = 0;
image_index = 0;

healthpoints = 28;
prevHealthPoints = healthpoints;
canHit = false;
drawHitSpark = false;
drawBoss = true; //Should we be visible? (Can't use the 'visible' variable as this prevents the Draw event from executing)

alarm[8] = 1;

//Variables to make it work with prtEnemy
reflectProjectiles = false;
reflectProjectilesLeft = false;
reflectProjectilesRight = false;
dead = false;

//Default damage
var oldFrozen = global.frozen;
	
for (var i = 0; object_exists(i); i++) {
    if object_is_ancestor(i, prtPlayerProjectile) and i != prtShieldWeapon {
        instance_deactivate_object(prtPlayer);
		global.frozen = true;
        var proj = instance_create(0, 0, i);
        damage[i] = proj.defaultBossDamage;
        with proj instance_destroy();
    }
}
global.frozen = oldFrozen;
if (!instance_exists(objBeat) or !objBeat.target_found) instance_activate_object(prtPlayer); //This fixes a glitch where the create event triggering while the player is colliding with an enemy/projectile/hazard/etc. causes the player to be hit even when they're supposed to be in the middle of i-frames.

