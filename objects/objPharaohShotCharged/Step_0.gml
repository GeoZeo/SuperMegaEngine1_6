event_inherited();

//Destroy upon level end
if !thrown {
	if instance_exists(objBossDeathTimer) {
		with objBossDeathTimer {
			if alarm[1] > 0 || prtPlayer.locked {
				with other instance_destroy();
			}
		}
	}
}

