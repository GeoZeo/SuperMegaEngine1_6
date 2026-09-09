event_inherited();

for (var i = 0; i < 14; i++) {
    instance_create(x + i * 16, y, objSectionArrowDown);
}

instance_create(x, y - 16, objSectionBorderBottomScreen);

