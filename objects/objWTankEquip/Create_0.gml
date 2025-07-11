event_inherited();

eqName = "W-TANK";
description = "Fully restores one of your weapons' energy when used.";
usable = true;
maxUnits = 9;
showZero = true;
buyable = true;
price = 30;

useOnWeapon = true;
useOnIndex = 0;     // What weapon/util will this tank refill?
firstCheck = true;  // Is the first check during the step function after a weapon/util is selected?
playRestoreSound = true;   //Can we play the energy restore SFX? Or is it already playing?

