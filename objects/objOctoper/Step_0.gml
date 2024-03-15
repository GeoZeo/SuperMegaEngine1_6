event_inherited();

if !global.frozen && !dead {

    if xspeed == 0 && yspeed == 0 {
        xspeed = image_xscale * 0.5;
        yspeed = -0.5;
    }
    if xspeed < 0 && x < __view_get( e__VW.XView, 0 ) + 96 {
        xspeed *= -1;
    }
    
    if xspeed > 0 && x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 16 {
        xspeed *= -1;
    }
    
    if yspeed < 0 && y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 {
        yspeed *= -1;
        if !instance_exists(objOctoShot) {
            var shot = instance_create(x + image_xscale * 32, y + 40, objOctoShot);
        }
    }
    
    if yspeed > 0 && y > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 {
        yspeed *= -1;
    }
    
}

