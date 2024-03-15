event_inherited();

if !ground and !isShoot {
    reflectProjectilesLeft = image_xscale < 0;
    reflectProjectilesRight = image_xscale > 0;
}
else {
    reflectProjectilesLeft = false;
    reflectProjectilesRight = false;
}

