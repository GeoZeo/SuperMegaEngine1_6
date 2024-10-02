/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

playSFX(sfxMenuSelect);
global.damageMultiplier = 0.5;
with prtPlayer createGuardPowerUpEffect = true; //Comment this line out if you want the item to be like it is in MM9 instead of MM10

return true;

