instance_destroy();

if deactivate {
    if (!instance_exists(objBeat) or !objBeat.target_found) instance_activate_object(prtPlayer);
    instance_activate_object(objHealthWeaponBar);
	instance_activate_object(objCheckpointFlag);
	instance_activate_object(objGravityChanger);
	instance_activate_object(objMusicPlayer);
    instance_activate_object(objBossDoor);
	instance_activate_object(objBossDoorH);
	instance_activate_object(objTeleport);
	instance_activate_object(objAchievementBox);
	instance_activate_object(objAchievementBoxSmall);
}

