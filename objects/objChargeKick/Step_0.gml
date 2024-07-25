if !global.frozen {
	image_speed = img_speed;
}
else {
	image_speed = 0;
}

if instance_exists(prtPlayer) and prtPlayer.isSlide {
    prtPlayer.canHit = false;
    image_xscale = prtPlayer.image_xscale;
    x = prtPlayer.x + prtPlayer.image_xscale * 5;
    y = prtPlayer.y + prtPlayer.sprite_height / 2;
}
else {
    instance_destroy();
}

