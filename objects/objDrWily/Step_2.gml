if !moveMM && !finishedMove {
	if !instance_exists(objArenaStartingPoint) {
		with prtPlayer image_xscale = 1;
		with prtPlayer visible = true;
		revealBackground = true;
		finishedMove = true;
	}
	else {
		if objArenaStartingPoint.isMM {
			with prtPlayer visible = false;
			
			if !global.frozen {
				with objBossDeathTimer {
					if alarm[0] > 0 {
						alarm[0]++;
					}
				}
			}
		}
	}
}

