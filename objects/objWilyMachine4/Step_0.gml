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
        //if sprite_index == sprWilyMachine4b and ((yspeed < 0 and sprite_get_bottom() <= __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 45) or (yspeed > 0 and sprite_get_bottom() >= __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 45)) {
        //    yspeed = 0;
        //    y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 45 - sprite_height;
        //}
        if sprite_index == sprWilyMachine4b {
			
			var yCoord_phase2 = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 43.4765625 - sprite_height;
			
			if y == yCoord_phase2 {
				yspeed = 0;
				if xspeed == 0 and !control.canFillHealthBar and !control.fillingHealthBar {
					if global.bossHealth > 0
						xspeed = -spd;
	            }
	            else if random(1000) <= 1 or x < __view_get( e__VW.XView, 0 ) + 64 or x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - sprite_width {
	                xspeed *= -1;
	            }
			}
			else
			{
				if y < yCoord_phase2 {
					yspeed = spd;
					if y + yspeed > yCoord_phase2 {
						yspeed = 0;
						y = yCoord_phase2;
					}
				}
				else if y > yCoord_phase2 {
					yspeed = -spd;
					if y + yspeed < yCoord_phase2 {
						yspeed = 0;
						y = yCoord_phase2;
					}
				}
			}
            if (explosionCounter < explosionMax || y != yCoord_phase2) && global.bossHealth <= 0 && !dead {
				if explosionTimer <= 0 {
					var explosion = instance_create(x + random(64), y + random(64), objExplosion4);
					explosion.depth = depth - 1;
					alarm[0] = -1;
					explosionCounter++;
					if explosionCounter >= explosionMax {
						explosionCounter = explosionMax;
						if y == yCoord_phase2 && global.bossHealth > 0 && !dead
							nullifyDeath(true);
					}
				}
				explosionTimer++;
				if explosionTimer >= explosionTime && (explosionCounter < explosionMax or y != yCoord_phase2)
					explosionTimer = 0
			}
			else if global.bossHealth <= 0 && !dead && (!control.canFillHealthBar and !control.fillingHealthBar) {
				nullifyDeath(true);
			}
			if control.canFillHealthBar or control.fillingHealthBar
				alarm[0] = -1;
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

