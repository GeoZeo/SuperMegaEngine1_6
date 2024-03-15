//Set position to above the player's head
if instance_exists(prtPlayer) {
    x = prtPlayer.x + prtPlayer.image_xscale;
    y = prtPlayer.y - 20;
}
else {
    instance_destroy();
}

