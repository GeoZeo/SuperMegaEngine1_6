if sprite_index == prtPlayer.spriteTeleport {
    drawSelf3Colors(global.primaryCol, global.secondaryCol, global.outlineCol);
}
if on && drawLED && sprite_index != prtPlayer.spriteTeleport && timerLED > 0.5 {
    draw_rectangle_colour(x + 11, y - 22, x + 20, y - 21, c_red, c_red, c_red, c_red, false);
}

