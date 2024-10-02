/// @description onWeaponGetStep

if shots == 3 {
    with global.weapons[global.currentWeapon] event_user(3);
	if instance_exists(objPharaohShotCharged) and !objPharaohShotCharged.thrown {
	    prtPlayer.canMove = true;
	    event_user(4);
	    prtPlayer.canMove = false;
		shots++;
	}
}
if timer == 0 {
    switch shots {
        case 0: instance_create(186, 0, objTelly); instance_create(82, 223, objTelly); global.keyUp = true; global.keyDown = false; global.keyRight = false; global.keyLeft = false; break;
        case 2: global.keyUp = false; global.keyDown = true; global.keyRight = false; global.keyLeft = false; break;
        default: global.keyUp = false; global.keyDown = false; global.keyRight = false; global.keyLeft = false;
    }
    with global.weapons[global.currentWeapon] {
        ammo = global.maxAmmo;
        if shots < 3 {
            event_user(1);
        }
    }
    if shots < 3 shots++;
}
timer++;
if timer > maxTimer {
    timer = 0;
}

