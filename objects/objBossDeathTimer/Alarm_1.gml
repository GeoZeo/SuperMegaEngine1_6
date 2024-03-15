/// @description  Initialize fake Mega Man movement

x = prtPlayer.x;
y = prtPlayer.y;
sprite_index = prtPlayer.spriteWalk;
image_speed = prtPlayer.speedWalk;
isMM = true;

with prtPlayer visible = false;
with prtPlayerProjectile instance_destroy();

