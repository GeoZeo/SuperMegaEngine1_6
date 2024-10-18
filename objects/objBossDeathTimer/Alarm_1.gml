/// @description  Initialize fake Mega Man movement

x = prtPlayer.x;
y = prtPlayer.y;
inWater = prtPlayer.inWater;
prtPlayer.inWater = false;
bubbleTimer = prtPlayer.bubbleTimer;
sprite_index = prtPlayer.spriteStep;
image_speed = prtPlayer.speedStep;
image_xscale = prtPlayer.image_xscale;
isMM = true;

with prtPlayer visible = false;
with prtPlayerProjectile instance_destroy();

