if deactivate {
    if instance_exists(prtPlayer) {
        with prtPlayer playerCamera();
    }
    
    instance_deactivate_all(true);
    instance_activate_object(objGlobalControl);
}

