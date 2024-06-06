event_inherited();

if !ground and !isShoot and !isThrow and !climbing and !isHit and !isSlide and !teleporting and !showReady and !dead {
    reflectProjectilesLeft = image_xscale < 0;
    reflectProjectilesRight = image_xscale > 0;
}
else {
    reflectProjectilesLeft = false;
    reflectProjectilesRight = false;
}


