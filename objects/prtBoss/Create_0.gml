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
bossID = -1;

//Do we always have to fight this boss even if it's already been beaten once?
bPersistent = true;

//Initialization variables, don't change
global.weaponID = weaponID;
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
        global.frozen = true;
        var proj = instance_create(0, 0, i);
        damage[i] = proj.defaultBossDamage;
        with proj instance_destroy();
    }
}
global.frozen = oldFrozen;

