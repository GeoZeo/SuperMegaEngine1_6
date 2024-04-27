if instance_exists(prtPlayer) && sprite_index == prtPlayer.spriteTeleport && (!prtPlayer.showReady and !prtPlayer.teleporting) {
	
	drawSelf3Colors(global.primaryCol, global.secondaryCol, global.outlineCol);
}
if on && drawLED && (sprite_index != teleportSprite or !instance_exists(prtPlayer)) && timerLED > 0.5 {
    draw_rectangle_colour(x - 5, y - 22, x + 4, y - 21, c_red, c_red, c_red, c_red, false);
}

