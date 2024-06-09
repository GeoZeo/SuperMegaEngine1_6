if !dead && canPlayerInteract && other.id_of_origin != prtPlayer {
    playSFX(sfxEnemyHit);
    healthpoints -= other.defaultDamage;
    if !hitWhite || healthpoints <= 0 visible = false; isHit = true;
    if healthpoints <= 0 {
        dead = true;
        instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
        if !other.passThrough and ! other.unstoppable {
            with other instance_destroy();
        }
        instance_destroy();
    }
    else if !other.unstoppable {
        with other instance_destroy();
    }
}