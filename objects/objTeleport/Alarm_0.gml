/// @description  Go to destination

//Move camera to destination
prtPlayer.x = toX;
prtPlayer.y = toY;
prtPlayer.newSectionXOffset = 0;
prtPlayer.newSectionYOffset = 0;
with prtPlayer playerCameraInit();

x = toX;
y = toY;

show_debug_message("Teleport to (" + string(toX) + "," + string(toY) + ") now!");

