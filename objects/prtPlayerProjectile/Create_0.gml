dir = 1;
with prtPlayer {
    other.dir = sign(image_xscale);
}
image_xscale = dir;
new_x = x;
new_y = y; //This bypasses solid gimmicks placing projectiles outside them upon collision and causing bugs when collision stacking isn't applied
xspeed = 0;
yspeed = 0;
xaccel = 0;
yaccel = 0;
img_speed = 0;
reflected = false;

gravityEnabled = false;     //Does gravity affect this projectile?
collisionEnabled = false;   //Is collision enabled for this projectile?
groundEnabled = false;      //Should this projectile collide with ground?
destroyOnHorizontalCollision = false;
destroyOnVerticalCollision = false;
reflectible = true;     //Can it be reflected?
pierceReflectors = false;
allowHitSound = true;

//Reflection
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left

explosionEffect = false; //Create explosion effect upon being destroyed?
destroyOnReflect = false;
destroyOnSwitch = true; //Should this projectile be destroyed when switching weapons?
destroyOnScroll = true; //Should this projectile be destroyed when switching sections?
destroyOnPause = true;  //Should this projectile be destroyed when pausing?
doesNotCount = false;   //Should this projectile be ignored when counting projectiles on screen?
update_rate = 1;

defaultDamage = 1;
defaultBossDamage = 1;
passThrough = false;    //Projectile goes on if enemy is killed
unstoppable = false;    //Projectile always goes on
checkDeath = true;      //Should enemy death be checked on collision?

enemyID = [];
shotID = [];
gimmickID = [];
solidID = [];

alarm[0] = 1;

singleHit = false;  //Hits each enemy only once
deleteFromIgnore = false;  //Susceptible to having hit targets removed from ignore on a timer?
ignore = ds_list_create();  //List of enemies to ignore (used for singleHit)

