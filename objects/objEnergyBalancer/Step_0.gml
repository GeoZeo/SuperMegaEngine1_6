if global.frozen == false
{
    image_speed = 1/12;

    if insideView()
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
        
        y += yspeed;
    }
}
else
{
    image_speed = 0;
}

