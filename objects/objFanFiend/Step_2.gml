if !global.frozen and !dead and !dying {
    image_speed = 0.2 * update_rate;
}
with prtPlayer {
    if x > other.x || other.dead || other.dying {
        other.wind.xspeed = 0;
    }
    else {
        other.wind.xspeed = other.dir;
    }
}

