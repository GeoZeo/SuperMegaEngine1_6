event_inherited();

if !global.frozen {
	image_speed = 10/60;
    if image_index >= 7 and xspeed == 0 {
        if instance_exists(prtPlayer) and instance_exists(objWilyMachine4) and objWilyMachine4.sprite_index == sprWilyMachine4b {
            xspeed = min(-2, sprite_get_xcenter_object(prtPlayer) - x);
            yspeed = sprite_get_ycenter_object(prtPlayer) - y;
            var len = sqrt(power(xspeed, 2) + power(yspeed, 2));
            xspeed = xspeed * 2 / len;
            yspeed = yspeed * 2 / len;
        }
        else {
            xspeed = -2;
            yspeed = random(2) / 2;
        }
    }
    if xspeed != 0 && image_index < 7 {
        image_index = 7;
    }
    if image_index < 7 and instance_exists(objWilyMachine4) {
        x = objWilyMachine4.x + 20;
        y = objWilyMachine4.y + objWilyMachine4.sprite_height / 2 + 16;
    }
}
else {
	image_speed = 0;
}

