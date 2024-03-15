if !global.frozen {
    alarm[0] = 12;
    global.frozen = true;
    playSFX(sfxCentaurFlash);
    with prtEnemy {
        if !dead && canHit && !reflectProjectiles && insideView() {
            healthpoints -= damage[objCentaurFlash];
            playSFX(sfxEnemyHit);
            check_enemy_death();
        }    
    }
}
defaultDamage = 4;
defaultBossDamage = 0;

