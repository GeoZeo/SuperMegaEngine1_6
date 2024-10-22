blackAlpha = 0;
blackAlphaIncrease = 0.2;
blackAlphaTimer = 0;
blackAlphaTimerMax = 2;
weapons_per_col = global.weapons_per_col;
playerSprite = prtPlayer.spriteStandDefault;

phase = 0;  //0: increasing the black rectangle's alpha
option = global.currentWeapon;
oldWeapon = global.weapon;
resetWeapon = false; //Should we, after exiting the menu, reset our weapon to the weapon that was used before the pause menu was opened? 

primedItemIndex = -1;

arrowTimer = 0;

with prtPlayer event_user(0);

with objShake
{
	if alarm[0] > 0
		alarm[0]--;
}

//For auto-shifting through the options in the menu
//Horizontal
h_as_delay = 25;
h_as_rate = 5;
h_as_init_timer = h_as_delay;
h_as_timer = h_as_rate;

//Vertical
v_as_delay = 25;
v_as_rate = 5;
v_as_init_timer = v_as_delay;
v_as_timer = v_as_rate;

