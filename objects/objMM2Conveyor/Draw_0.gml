if size >= 3 {
    for(var i = 0; i < size; i++) {
        if i == 0
            draw_sprite(sprMM2Conveyor, arrowImg, round(x), round(y));
        else if i == size-1
            draw_sprite(sprMM2Conveyor, arrowImg, round(x)+i*16, round(y));
        else
            draw_sprite(sprMM2Conveyor, midImg, round(x)+i*16, round(y));
    }
    
    if !global.frozen {
        // Animation //
        
        //Arrows
        arrowTimer += update_rate;
        if arrowTimer >= 13 {
            arrowTimer = 0;
            if arrowImg == 4 {
                if dir == 1
                    arrowImg = 3;
                else
                    arrowImg = 2;
            }
            else
                arrowImg = 4;
        }
        
        //Middle
        midTimer += update_rate;
        if midTimer >= 5 {
            midTimer = 0;
            if midImg == 0
                midImg = 1;
            else
                midImg = 0;
        }
    }
    else {
        if instance_exists(objSectionSwitcher) {
            arrowImg = 4;
            midImg = 0;
        }
    }
}
else {
    for(var i = 0; i < size; i++) {
        draw_sprite(sprMM2Conveyor, midImg, round(x)+i*16, round(y));
    }
    
    if !global.froze {
        // Animation //
        
        //Middle
        midTimer += update_rate;
        if midTimer >= 5 {
            midTimer = 0;
            if midImg == 0
                midImg = 1;
            else
                midImg = 0;
        }
    }
}

