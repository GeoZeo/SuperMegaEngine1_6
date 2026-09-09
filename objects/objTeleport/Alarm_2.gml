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
	x = mask_get_xcenter_object(prtPlayer);
	y = mask_get_ycenter_object(prtPlayer);
	on = true;
}

	