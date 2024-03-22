/// @description drawPlayer()
function drawPlayer() {
	//Draws the player.

	if !prtPlayer.dead || prtPlayer.killTimer mod 2 == 1
		drawSelf3Colors(global.primaryCol, global.secondaryCol, global.outlineCol);



}
