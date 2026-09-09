alarm[0] = 1;
canStep = false;
contactDamage = 0;
singleHit = true;
deleteFromIgnore = false;  //Susceptible to having hit targets removed from ignore on a timer?
ignore = ds_list_create();
reflectible = true;
reflected = false;
pierceReflectors = false;
allowHitSound = true;

//Reflection
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left

new_x = x;
new_y = y;
passThrough = false;
unstoppable = false;
checkDeath = true;
explosionEffect = false;
projID = -1;
enemyID = [];
shotID = [];
gimmickID = [];
solidID = [];
xspeed = 0;
yspeed = 0;
update_rate = 1;

