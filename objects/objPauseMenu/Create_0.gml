blackAlpha = 0;
blackAlphaIncrease = 0.2;
blackAlphaTimer = 0;
blackAlphaTimerMax = 2;
weapons_per_col = global.weapons_per_col;

phase = 0;  //0: increasing the black rectangle's alpha
option = global.currentWeapon;
oldWeapon = global.weapon;
resetWeapon = false; //Should we, after exiting the menu, reset our weapon to the weapon that was used before the pause menu was opened? 

primedItemIndex = -1;

with prtPlayer event_user(0);

