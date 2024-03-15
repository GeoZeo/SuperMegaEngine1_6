//Teleport away
teleportingUp = true;
sprite_index = sprRushTeleport;
playSFX(sfxTeleportOut);
dead = true;
xspeed = 0;
yspeed = 0;
decreaseAmmoTimerIncrement = 0;

with prtPlayer {
    if onRushJet {
        onRushJet = false;
        canWalk = true;
    }
}

