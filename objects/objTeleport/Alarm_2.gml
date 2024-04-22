/// @description Lock MM for a timer warp

if checkGrounded {
	playerLocked = true;
}
else {
	if warpTime > 0
		alarm[3] = warpTime;
}
playerLockMovement();
if warpTime <= 0 {
	x = prtPlayer.x;
	y = prtPlayer.y;
	on = true;
}

	