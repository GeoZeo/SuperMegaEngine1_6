/// onShoot

ok = true;

if projectileCount() >= maxshots
|| ammo <= 0 || !instance_exists(prtPlayer) {
    print("Can't shoot " + name);
    ok = false;
    return false;
}

if prtPlayer.image_xscale == 1
    box = prtPlayer.bbox_right + prtPlayer.shoot_shift;
else
    box = prtPlayer.bbox_left - prtPlayer.shoot_shift;
    
switch prtPlayer.sprite_index {
    case prtPlayer.spriteStand: yy = prtPlayer.y+prtPlayer.shoot_height; break;
    case prtPlayer.spriteStep: yy = prtPlayer.y+prtPlayer.shoot_height; break;
    case prtPlayer.spriteWalk: yy = prtPlayer.y+prtPlayer.shoot_height; break;
    case prtPlayer.spriteJump: yy = prtPlayer.y+prtPlayer.jump_shoot_height; break;
    case prtPlayer.spriteClimb: yy = prtPlayer.y+prtPlayer.shoot_height; break;
    default: yy = prtPlayer.y+prtPlayer.shoot_height; break;
}

if prtPlayer.climbing {
    prtPlayer.image_xscale = prtPlayer.climbShootXscale;
    
    if prtPlayer.image_xscale == 1
        box = prtPlayer.bbox_right;
    else
        box = prtPlayer.bbox_left;
}

if sfx != noone {
    playSFX(sfx);
}

ammo -= consumption;
if ammo < 0 {
    ammo = 0;
}
if bThrow {
    prtPlayer.isThrow = true;
}
else {
     prtPlayer.isShoot = true;
}

prtPlayer.shootTimer = 0;

print("Shooting " + name);

if (cooldown > 0) {
    with prtPlayer canShoot = false;
    alarm[11] = cooldown;
}

