if !global.frozen {
    gravityNoGround();
    
    var ddy;
    if dy == -18
        ddy = -17;  //To avoid dividing by 0
    else
        ddy = dy;
    
    xspeed = dx / ( (3 + (ddy / 6)) * const ) * image_xscale;
    
    event_inherited();
    
    image_speed = 1/6;
}
else
{
    image_speed = 0;
}

