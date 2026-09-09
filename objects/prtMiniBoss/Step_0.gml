event_inherited();

if !dead && insideView() {
    instance_deactivate_object(objSectionArrowRight);
    instance_deactivate_object(objSectionArrowLeft);
    instance_deactivate_object(objSectionArrowUp);
    instance_deactivate_object(objSectionArrowDown);
}

if dead && insideView() {
    instance_activate_object(objSectionArrowRight);
    instance_activate_object(objSectionArrowLeft);
    instance_activate_object(objSectionArrowUp);
    instance_activate_object(objSectionArrowDown);
}

