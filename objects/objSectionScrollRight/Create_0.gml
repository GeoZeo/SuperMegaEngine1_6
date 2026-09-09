event_inherited();

for (var i = 0; i < 14; i++) {
    instance_create(x, y + i * 16, objSectionArrowRight);
}

instance_create(x + 16, y, objSectionBorderLeftScreen);

