image_speed = 10 / room_speed;
prevImgInd = image_index;
target = -1;
target_found = false;
normalSpd = 3;
pullSpd = 1;
fallSpd = 0.32421875;
transportSpd = 0.6484375;
transportAcc = 0.025;
transportDec = 0.025;
xspeed = 0;
yspeed = 0;
grav = 5;
gravWater = 3;
currentGrav = grav;
flapCount = 4;
flapCounter = 0;
carrying = false;
tired = false;
transportTime = 4 * 60;
transportTimer = 0;
drawArrows = true; //Set to false if you want it to be like MM9 instead

update_rate = 1;

