if !dead {
    if other.canHit {  
        with other playerGetHit(other.contactDamage);
        moveTimer = 0;
        retreating = true;
        yspeed = -3;
    }
}

