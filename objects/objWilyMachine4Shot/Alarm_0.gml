if instance_exists(objWilyMachine4) and objWilyMachine4.sprite_index == sprWilyMachine4b {
    shot_xspeed = min(-2, player_x - x);
    shot_yspeed = player_y - y;
    var len = sqrt(power(shot_xspeed, 2) + power(shot_yspeed, 2));
            
	if player_x >= x
		shot_xspeed = -2;
	else
		shot_xspeed = shot_xspeed * 2 / len;
			
	if player_x >= x or player_y < y
		shot_yspeed = 0;
	else
		shot_yspeed = shot_yspeed * 2 / len;
}
else {
    shot_xspeed = -2;
    shot_yspeed = random(2) / 2;
}

