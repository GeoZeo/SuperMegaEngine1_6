/// @description  Stop hit spark
canHit = true;
drawBoss = true;
drawHitSpark = false;
canPlayHitSound = true;
if control > -1 {
	with control {
		if other.hitWhite { hitWhite = false; }
		else { visible = true; }
	}
}

alarm[9] = -1;

