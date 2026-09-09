//Teleport away
teleportingUp = true;
sprite_index = sprRushTeleport;

if playTeleportSound {
	playSFX(sfxTeleportOut);
	playTeleportSound = false;
}
	
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

