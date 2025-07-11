event_inherited();

if !global.frozen and !dead and !dying {
    if !moving {
        moveTimer += update_rate;
        if floor(moveTimer) == 10 {
            image_index = 0;    //After touching a wall, we want the eye to close slowly (half-open the first 10 frames)
        }
        if floor(moveTimer) == 110 {
            image_index = 1;    //Eye half-open
        }
        else if floor(moveTimer) >= 120 {
            image_index = 2;
            moving = true;
        }
        xspeed = 0;
        yspeed = 0;
    }
    else {
        if dir == "hor"
            xspeed = startDir * 3;
        else
            yspeed = startDir * 3;
            
        generalCollision();
        
        if (xspeed == 0 && dir == "hor") || (yspeed = 0 && dir == "ver") {
            moving = false;
            moveTimer = 0;
            image_index = 1; //Eye half-open
            startDir = -startDir;   //Change the direction
        }
        
		x += xspeed * update_rate;
        y += yspeed * update_rate;
    }
}
else {
    if dead || dying {
        moveTimer = 0;
        startDir = beginStartDir;
        moving = false;
        image_index = 0;
    }
}

