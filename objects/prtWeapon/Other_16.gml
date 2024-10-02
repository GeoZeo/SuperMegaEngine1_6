/// @description onWeaponGetStep

if timer == 0 {
    switch shots {
        case 0: global.keyUp = true; global.keyDown = false; global.keyRight = false; global.keyLeft = false; break;
        case 1: global.keyUp = true; global.keyDown = false; global.keyRight = true; global.keyLeft = false; break;
        case 3: global.keyUp = false; global.keyDown = true; global.keyRight = true; global.keyLeft = false; break;
        case 4: global.keyUp = false; global.keyDown = true; global.keyRight = false; global.keyLeft = false; break;
        default: global.keyUp = false; global.keyDown = false; global.keyRight = false; global.keyLeft = false;
    }
    with global.weapons[global.currentWeapon] {
        ammo = global.maxAmmo;
        event_user(1);
    }
    with prtPlayer playerShoot();
    shots++;
}
timer++;
if timer > maxTimer {
    timer = 0;
}

