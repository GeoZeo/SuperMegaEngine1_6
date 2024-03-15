event_inherited();

if !global.frozen and !dead {
    xspeed = dir * spd;
    
    x -= xspeed * update_rate;
}

