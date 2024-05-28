xspeed = 0;
yspeed = 0;
currentGrav = cfgGravity;
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

