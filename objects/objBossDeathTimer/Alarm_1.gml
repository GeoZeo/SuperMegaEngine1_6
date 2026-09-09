/// @description  Initialize fake Mega Man movement

with prtPlayer playerCheckGround();

x = prtPlayer.x;
y = prtPlayer.y;
depth = prtPlayer.depth;
ground = prtPlayer.ground;
inWater = prtPlayer.inWater;
isFly = prtPlayer.isFly;
flying = prtPlayer.flying;
isRollback = prtPlayer.isRollback;
rollbackMovement = prtPlayer.rollbackMovement;
prtPlayer.inWater = false;
bubbleTimer = prtPlayer.bubbleTimer;
prtPlayer.blinkTimer = 0;
prtPlayer.blinkImage = 0;
sprite_index = prtPlayer.spriteStep;
image_speed = prtPlayer.speedStep;
image_xscale = prtPlayer.image_xscale;
isMM = true;

with prtPlayer visible = false;
with prtPlayerProjectile instance_destroy();
with objReflectedProjectile if id_of_origin != prtPlayer instance_destroy();

