if !global.frozen {
    xspeed = cos(degtorad(dir)) * 1.5 * xscale;
    yspeed = -sin(degtorad(dir)) * 1.5;   //The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
}

event_inherited();

