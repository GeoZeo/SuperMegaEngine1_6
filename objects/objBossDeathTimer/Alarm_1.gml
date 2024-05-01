/// @description  Initialize fake Mega Man movement

x = prtPlayer.x;
y = prtPlayer.y;
sprite_index = prtPlayer.spriteStep;
image_speed = prtPlayer.speedStep;
isMM = true;

with prtPlayer visible = false;
with prtPlayerProjectile instance_destroy();

