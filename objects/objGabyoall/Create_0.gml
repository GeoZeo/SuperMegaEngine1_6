//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)
//dir = -1/1 (1 = faces right (default); -1 = faces left)

event_inherited();

contactDamage = 3;

//Example of how to use the spawning/action radii.
//NOTE: Only use for the default of this enemy by uncommenting and removing from creation code on all instances if you're not too fazed about accuracy to MM1.
//Highly recommended that you remove any overlap between these and section borders/scroll arrow blocks without changing the positions if you can (check the blue Gabyoall instance creation code in rmBeta for more details).
//mySpawnArea = instance_create(x-12, bbox_bottom-8, objEnemySpawnArea);
//mySpawnArea.image_xscale = 1.5;
//mySpawnArea.image_yscale = 1/2;
//mySpawnArea.x = x-12; //Demonstration of specifically how to set position on instances; not actually necessary here.
//mySpawnArea.y = bbox_bottom-8;

//myActionArea = instance_create(x-24, bbox_bottom-8, objEnemyActionArea);
//myActionArea.image_xscale = 3;
//myActionArea.image_yscale = 1/2;
//myActionArea.x = x-24;
//myActionArea.y = bbox_bottom-8;

var damages = array_length_1d(damage);
for (var i = 0; i < damages; i++) {
    damage[i] = 0;
}

damage[objPharaohShot] = 1;
damage[objPharaohShotCharging] = 1;
damage[objPharaohShotCharged] = 1;
damage[objDrillBombExplosion] = 1;
damage[objTimeSlow] = 1;

//Enemy specific code
col = 0; //0 = red; 1 = orange; 2 = blue
frozeTimer = 0;
dashing = false;
startDir = -1; // Default start direction is left.

image_speed = 0.2;
image_index = 0;

alarm[0] = 1;

