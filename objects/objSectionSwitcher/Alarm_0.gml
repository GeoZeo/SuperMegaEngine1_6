if door {
    image_speed = 0; //Change from 0 to imgSpd if you want animations to play during door openings.
    alarm[1] = ceil(4 / 0.15)
    with prtPlayer {
        if isHit {
            hitTimer = hitTime;
        }
    }
}
else						//Comment these two lines out if you
    image_speed = imgSpd;	//want animations to play during door openings.
    
canStep = true;

