dir = 1;
with prtPlayer {
    other.dir = sign(image_xscale);
}
image_xscale = dir;
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
explosionEffect = false; //Created explosion effect upon being destroyed?
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

alarm[0] = 1;

singleHit = false;  //Hits each enemy only once
ignore = ds_list_create();  //List of enemies to ignore (used for singleHit)

