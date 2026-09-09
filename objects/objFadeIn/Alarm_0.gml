if deactivate {
    if instance_exists(prtPlayer) {
        with prtPlayer playerCamera();
    }
    
    instance_deactivate_all(true);
    instance_activate_object(objGlobalControl);
	instance_activate_object(objCheckpointFlag);
	instance_activate_object(objAchievementBox);
	instance_activate_object(objAchievementBoxSmall);
}

