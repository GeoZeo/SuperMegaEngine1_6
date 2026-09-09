if canEndStep {
	///Hitspark and death
	if healthpoints < prevHealthPoints {
		event_user(14);
		if healthpoints > 0 {
			canHit = false;
			if !repeatHitSound canPlayHitSound = false;
			alarm[9] = 2;
			alarm[10] = invincibilityTime; //Being able to get hit again
			drawBoss = false;
			drawHitSpark = true;
			if control > -1 {
				with control {
					if other.hitWhite { hitWhite = true; }
					else if healthBarFlash { visible = false; }
				}
			}
            
			global.bossHealth = healthpoints;
		}
		else {
			global.bossHealth = 0;
			healthpoints = 0;
			dead = true;
			event_user(15);
			if dead {
				if !control.stopInitMusic && control.music == -1 && !control.endLevel {
					stopAllSFXsansMusic();
				}
				else {
					stopAllSFX();
				}
				playSFX(sfxDeath);
                
				var i, explosionID;
                    
				doExplosion(sprite_get_xcenter(), sprite_get_ycenter(), 1.5, explosionDepth);
                
				doExplosion(sprite_get_xcenter(), sprite_get_ycenter(), 2.5, explosionDepth);
                
				instance_activate_object(objTeleport);
				with objTeleport {
					if !insideView() and boss == other.bossID {
					    instance_destroy();
					}
				}
    
				if cfgDestroyBossProjectilesOnBossDeath
					with prtEnemyProjectile instance_destroy();
	
				instance_create(x, y, objBossDeathTimer);
				instance_destroy();
			}
            
		}
	}

	prevHealthPoints = healthpoints;
}

