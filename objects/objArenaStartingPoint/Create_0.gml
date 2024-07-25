xspeed = 0;
yspeed = 0;
inWater = false;
grav = cfgGravity;
gravWater = cfgGravityWater;
currentGrav = grav;
canSplash = true;
bubbleTimer = 0;
stepTime = cfgStepFrames;
stepTimer = 0;
isMM = false;
ground = false;
oldX = x;
prevGround = ground;
update_rate = 1;

if cfgDebug || debug_mode {
    visible = true;
}

