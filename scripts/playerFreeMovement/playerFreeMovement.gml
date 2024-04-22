/// @description playerFreeMovement()
function playerFreeMovement() {
	//Frees the player's movement (e.g. after being locked)

	with prtPlayer {
		locked = false;
		canSwitch = true;
	    canMove = true;
		canWalk = true;
		canGravity = true;
	    canSpriteChange = true;
	    canPause = true;
	    mask_index = mskMegaman;
	}



}
