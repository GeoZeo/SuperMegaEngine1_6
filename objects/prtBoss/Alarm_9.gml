/// @description  Hitspark

drawHitSpark = !drawHitSpark;
drawBoss = !drawBoss;
if control > -1 {
	with control {
		if other.hitWhite { hitWhite = !hitWhite; }
		else if healthBarFlash { visible = !visible; }
	}
}

alarm[9] = 2;

