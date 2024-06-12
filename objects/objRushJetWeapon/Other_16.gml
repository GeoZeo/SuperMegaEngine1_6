/// @description onWeaponGetStep

if shots == 0 {
	event_user(1);
	shots++;
}
if instance_exists(objRushJet) && objRushJet.sprite_index == sprRushJet {
	timer++;
	
	if prtPlayer.onRushJet {
		if (timer >= 2.0625 * 60 and timer < 2.5625 * 60)
			objRushJet.yspeed = -objRushJet.ySpd;
		else if (timer >= 3.0625 * 60 and timer < 3.5625 * 60)
			objRushJet.yspeed = objRushJet.ySpd;
		else
			objRushJet.yspeed = 0;
	}
	
	if timer == maxTimer && !prtPlayer.onRushJet {
		_jumpSpd = -prtPlayer.jumpSpeed;
	}
	if timer >= maxTimer && !prtPlayer.onRushJet {
		if _jumpSpd < 0 {
			global.yspeed = _jumpSpd;
			_jumpSpd += prtPlayer.currentGrav;
			if _jumpSpd >= 0 _jumpSpd = 0;
		}
		if !prtPlayer.onRushJet {
			if prtPlayer.x < objRushJet.x {
				global.xspeed = prtPlayer.walkSpeed;
			}
			else {
				global.xspeed = 0;
				prtPlayer.x = objRushJet.x;
			}
		}
	}
}

