/// @description OnDeath
image_blend = c_black;
__background_set_colour( c_black );
isFlash = false;
instance_create(x, y, objDrWily);
if x < player_x {
    image_xscale = -1;
}
else {
    image_xscale = 1;
}

