//Creation code:
//dir = -1/1 (-1 = opened from the left (default); 1 = opened from the right)

dir = -1;
    
opening = false;
closing = false;
canOpen = true;
openImgSpeed = 0.15;
image_speed = 0;

player_x = 0;

rushExit = false;

alarm[0] = 1;

halfDoor = false;   //Whether to use just half the door

mySolid = -1;

instance_create(x, floor(y / global.viewHeight) * global.viewHeight, objSectionBorderVertical);

