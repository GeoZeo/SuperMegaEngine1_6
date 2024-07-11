pickupID = -15;

image_speed = 1/6;
itemAmount = 0;
flash = false;
flashTimer = 0;
inWater = false; //Currently underwater?
canSplash = false;
grav = cfgGravity;
gravWater = cfgGravityWater;
currentGrav = grav;
xspeed = 0;
yspeed = 0;

targetable = true;  //For Hornet Chaser or other weapon grabbing weapons
grabbedBy = -1;
restartTimer = false;

//If a boss drops a pickup that triggers a teleport upon collection/despawn
teleport = false;
toX = 0;
toY = 0;

update_rate = 1;

