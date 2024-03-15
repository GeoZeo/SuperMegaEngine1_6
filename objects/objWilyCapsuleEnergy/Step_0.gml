event_inherited();

if !global.frozen {
    x = centerX + cos(degtorad(angle)) * radius;
    y = centerY + sin(degtorad(angle)) * radius;
    
    radius--;
    angle += 20;
    
    if radius == 0 {
        instance_destroy();
    }
}

