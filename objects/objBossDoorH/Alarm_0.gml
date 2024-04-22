if dir == -1 && canOpen && !halfDoor {
    mySolid = instance_create(x, y+16, objSolid);
    mySolid.image_xscale = 4;
}
else {
    mySolid = instance_create(x, y, objSolid);
    mySolid.image_xscale = 4;
}

