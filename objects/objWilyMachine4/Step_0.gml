event_inherited();

//print(startIntro, isIntro, startFight, isFight, y);


if !global.frozen {

    image_speed = 5 / room_speed * update_rate;
    if startIntro {
        y = ystart;
        x = xstart;
        yspeed = spd;
        startIntro = false;
        smoke1 = instance_create(x + 64, sprite_get_bottom(), objWilyMachine4Smoke);
        smoke2 = instance_create(x + 64 + 29, sprite_get_bottom(), objWilyMachine4Smoke);
    }
    
    if isFight {
        if sprite_get_bottom() > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 32 {
            yspeed = -spd;
            with objWilyMachine4Smoke {
                image_index = 0;
                visible = true;
            }
        }
        else if sprite_get_bottom() < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 or yspeed == 0 {
            yspeed = spd;
        }
        if sprite_index == sprWilyMachine4b and ((yspeed < 0 and sprite_get_bottom() <= __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 45) or (yspeed > 0 and sprite_get_bottom() >= __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 45)) {
            yspeed = 0;
            y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 45 - sprite_height;
        }
        if sprite_index == sprWilyMachine4b {
            if xspeed == 0 and !control.canFillHealthBar and !control.fillingHealthBar {
                xspeed = -spd;
            }
            else if random(1000) <= 1 or x < __view_get( e__VW.XView, 0 ) + 64 or x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - sprite_width {
                xspeed *= -1;
            }
            if (control.fillingHealthBar or control.canFillHealthBar) and instance_number(objExplosion4) < 4 and random(5) <= 1 {
                var explosion = instance_create(x + random(64), y + random(64), objExplosion4);
                explosion.depth = depth - 1;
            }
        }
        with objWilyMachine4Smoke {
            if image_index > 4 {
                visible = false;
            }
        }
        if alarm[0] <= 0 and instance_number(objWilyMachine4Shot) < 3 and !control.canFillHealthBar and !control.fillingHealthBar {
            alarm[0] = room_speed * 0.7 / update_rate;
        }
    }
    else {
        if sprite_get_bottom() > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 {
            yspeed = 0;
            control.healthBarTimerMax = 10;
            control.canFillHealthBar = true;
        }
        else {
            control.canFillHealthBar = false;
        }
    }
    bottom = sprite_get_bottom();
    with objWilyMachine4Smoke {
        y = other.bottom;
    }
}
else {
    if alarm[0] > 0 {
        alarm[0]++;
    }
}

