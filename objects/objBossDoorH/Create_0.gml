//Creation code:
//dir = -1/1 (-1 = opened from the top (default); 1 = opened from the bottom)

dir = -1;
    
opening = false;
closing = false;
canOpen = true;
openImgSpeed = 0.15;
image_speed = 0;

rushExit = false;

alarm[0] = 1;

halfDoor = false;   //Whether to use just half the door

mySolid = -1;

instance_create(floor(x / __view_get( e__VW.WView, 0 )) * __view_get( e__VW.WView, 0 ), y, objSectionBorderHorizontal);

