//NOTE: This is the fade in object that gets created at the start of every level
//That means that, by default, it deactivates all objects except itself and objGlobalControl, and only activates objPlayer and objHealthWeaponBar after a while
//Set deactivate to false if you don't want this behavior

blackAlpha = 1;
blackAlphaDecrease = 0.2;
blackAlphaTimer = 0;
blackAlphaTimerMax = 3;

alarm[0] = 1;
canAlarm = true;

deactivate = true;

reverse = false;    //After finishing the fade, start a new fade in the opposite direction

