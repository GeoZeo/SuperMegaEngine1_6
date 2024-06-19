/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

playSFX(sfxMenuSelect);
global.damageMultiplier = 0.5;

return true;

