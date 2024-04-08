event_inherited();

if keyboard_check(ord("D")) && !keyboard_check(ord("A"))
    xspeed = spd;
else if keyboard_check(ord("A")) && !keyboard_check(ord("D"))
    xspeed = -spd;
else
    xspeed = 0;
    
if keyboard_check(ord("S")) && !keyboard_check(ord("W"))
    yspeed = spd;
else if (keyboard_check(ord("W")) || (enableUpKey and keyboard_check(vk_up)))&& !keyboard_check(ord("S"))
    yspeed = -spd;
else
    yspeed = 0;

