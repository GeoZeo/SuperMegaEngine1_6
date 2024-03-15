if !global.frozen {

    if groundEnabled {
        checkGround();
    }
    
    if collisionEnabled {
        generalCollision();
        if destroyOnHorizontalCollision && xspeed == 0 {
            instance_destroy();
        }          
        if destroyOnVerticalCollision && yspeed == 0 {
            instance_destroy();
        }          
    }
    
    if gravityEnabled {
        if groundEnabled {
            gravityCheckGround();
        }
        else {
            gravityNoGround();
        }
    }
    
  

    xspeed += dir * xaccel;
    yspeed += yaccel;
    x += xspeed;
    y += yspeed; 
    image_speed = img_speed;
}
else {
    image_speed = 0;
}

