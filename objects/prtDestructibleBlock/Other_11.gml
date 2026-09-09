///// @description On Hit
////if playHitSound playSFX(sfxEnemyHit);
////healthpoints -= damage[other.object_index];
////if !hitWhite || healthpoints <= 0 visible = false; isHit = true;
//if healthpoints <= 0 {
//    dead = true;
//    instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
//    //if !other.passThrough and ! other.unstoppable {
//    //    with other instance_destroy();
//    //}
//    instance_destroy();
//}
////else if !other.unstoppable {
////    with other instance_destroy();
////}

////NOTE: Cut and paste entire uncommented event code into new collision events for objReflectedProjectile and prtPlayerProjectile if you don't want these to be affected by stacked collisions
////Make sure to put alarm[11] = flashTime; underneath the isHit = true; line, though.
