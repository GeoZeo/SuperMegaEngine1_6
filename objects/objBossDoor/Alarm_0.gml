if dir == -1 && canOpen && !halfDoor {
    mySolid = instance_create(x+16, y, objSolid);
    mySolid.image_yscale = 4;
}
else {
    mySolid = instance_create(x, y, objSolid);
    mySolid.image_yscale = 4;
}

