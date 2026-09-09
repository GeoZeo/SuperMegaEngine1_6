event_inherited();

if !global.frozen {
	stopSFX(sfxEnemyHit);
    playSFX(sfxExplosion4);
}

img_speed = 0.5;
reflectible = false;
unstoppable = true;

allowHitSound = false;

singleHit = true;

defaultDamage = 4;

