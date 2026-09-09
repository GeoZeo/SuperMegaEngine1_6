/// @description Death

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
    
    instance_create(x, y, objBossDeathTimer);
    instance_destroy();
}

