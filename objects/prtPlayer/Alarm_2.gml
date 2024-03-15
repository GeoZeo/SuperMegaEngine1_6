/// @description Initialize switching sections for doors

if newSectionXOffset > 0 //Switching to the right
{
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher) 
    {
        dir = "right";
        door = true;
    }
}
else if newSectionXOffset < 0 //Switching to the left
{
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher)
    {
        dir = "left";
        door = true;
    }
}
else if newSectionYOffset > 0 //Switching to the bottom
{
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher) 
    {
        dir = "down";
        door = true;
    }
}
else if newSectionYOffset < 0 //Switching to the top
{
    playerCameraInit();
    with instance_create(x, y, objSectionSwitcher)
    {
        dir = "up";
        door = true;
    }
}

