if !global.frozen and !dead and !dying {
    image_speed = 0.25 * update_rate;
}
else {
	image_speed = 0;
}
if dead {
	image_index = 0;
}
with prtPlayer {
    if x > other.x || other.dead || other.dying {
        other.wind.xspeed = 0;
    }
    else {
        other.wind.xspeed = other.windXspeed;
    }
	
	if other.dead || other.dying {
        other.wind.yspeed = 0;
    }
    else {
        other.wind.yspeed = other.windYspeed;
    }
}

