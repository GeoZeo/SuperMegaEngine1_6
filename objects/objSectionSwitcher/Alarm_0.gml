if door {
    image_speed = 0;
    alarm[1] = ceil(4 / 0.15)
    with prtPlayer {
        if isHit {
            hitTimer = hitTime;
        }
    }
}
else
    image_speed = imgSpd;
    
canStep = true;

