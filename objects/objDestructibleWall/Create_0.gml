event_inherited();

contactDamage = 0;
respawn = false;    //Shouldn't come back when entering the screen again
neverDespawn = true;    //Shouldn't be destroyed when outside of the screen

var damages = array_length_1d(damage);
for (var i = 0; i < damages; i++) {
    damage[i] = 0;
}
damage[objDrillBomb] = 1;
damage[objDrillBombExplosion] = 3;

mySolid = instance_create(x, y, objSolid);
mySolid.image_yscale = 2;

