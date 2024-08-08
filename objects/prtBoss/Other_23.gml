/// @description  Event: onPitfall - called when the boss falls into a pit
// To be overridden in child objects if necessary
global.bossHealth = 0;
healthpoints = 0;
dead = true;
event_user(15);
if dead {
    stopAllSFX();
    playSFX(sfxDeath);
                
    var i, explosionID;
                    
    instance_activate_object(objTeleport);
    with objTeleport {
        if !insideView() and boss == other.bossID {
            instance_destroy();
        }
    }
    
	if instance_exists(prtPlayer)
		instance_create(prtPlayer.x, prtPlayer.y, objBossDeathTimer);
	else
		instance_create(x, y-abs(yspeed)-1, objBossDeathTimer);
		
    instance_destroy();
}

