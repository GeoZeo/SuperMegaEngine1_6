decreaseAmmoTimerIncrement = 0;

with prtPlayer {
    if onRushJet && !canWalk {
        onRushJet = false;
        canWalk = true;
    }
}

