xspeed = 0;
yspeed = 0;
xaccel = 0;
yaccel = 0;
isFly = false;
flying = false;
isRollback = false;
rollbackMovement = false;
inWater = false;
grav = global.grav;
gravWater = global.gravWater;
currentGrav = grav;
canSplash = true;
bubbleTimer = 0;
stepTime = cfgStepFrames;
stepTimer = 0;
isMM = false;
ground = false;
prevGround = ground;
update_rate = 1;
startingDepth = depth;

if cfgDebug || debug_mode {
    visible = true;
}

