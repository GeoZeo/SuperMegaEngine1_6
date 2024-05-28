xspeed = 0;
yspeed = 0;
currentGrav = prtPlayer.currentGrav;
stepTime = cfgStepFrames;
stepTimer = 0;
isMM = false;
ground = true;
oldX = x;
prevGround = ground;
update_rate = 1;

if cfgDebug || debug_mode {
    visible = true;
}

