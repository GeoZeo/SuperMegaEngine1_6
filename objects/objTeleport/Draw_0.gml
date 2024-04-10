if instance_exists(prtPlayer) && sprite_index == prtPlayer.spriteTeleport {
    drawSelf3Colors(global.primaryCol, global.secondaryCol, global.outlineCol);
}
if on && drawLED && (sprite_index != prtPlayer.spriteTeleport or !instance_exists(prtPlayer)) && timerLED > 0.5 {
    draw_rectangle_colour((x-sceneryXOffset) + 11, y - 22, (x-sceneryXOffset) + 20, y - 21, c_red, c_red, c_red, c_red, false);
}

