if !global.frozen {
    alarm[0] = 0.35 * room_speed;
    global.frozen = true;
    playSFX(sfxCentaurFlash);
    with prtEnemy {
        if projCanTouch && !dead && !dying && canHit && !reflectProjectiles && ((insideView() and !checkFullSprite) or (insideView_Spr() and checkFullSprite)) {
            healthpoints -= damage[objCentaurFlash];
            playSFX(sfxEnemyHit);
            check_enemy_death();
        }    
    }
}
defaultDamage = 4;
defaultBossDamage = 0;
reflectible = false;

