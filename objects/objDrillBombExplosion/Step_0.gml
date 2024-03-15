event_inherited();

if !global.frozen {
    image_speed = 1;
}
else {
    image_speed = 0;
}

if floor(image_index) == 14 {
    instance_destroy();
}

