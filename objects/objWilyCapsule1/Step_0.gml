event_inherited();

if !global.frozen && isFight {
    if alarm[0] > 0 {
        drawHitSpark = false;
    }
    if alarm[0] < 1 && alarm[1] < 1 && alarm[2] < 1 && alarm[3] < 1 && alarm[4] < 1 {
        alarm[3] = 1;
    }
}
else if global.frozen {
    if alarm[0] > 0
        alarm[0]++;
    if alarm[1] > 0
        alarm[1]++;
    if alarm[2] > 0
        alarm[2]++;
    if alarm[3] > 0
        alarm[3]++;
	if alarm[4] > 0
        alarm[4]++;
}

