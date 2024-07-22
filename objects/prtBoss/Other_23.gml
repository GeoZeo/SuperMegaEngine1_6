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
                    
    doExplosion(sprite_get_xcenter(), (sprite_get_ycenter()-abs(yspeed))-1, 1.5);
                
    doExplosion(sprite_get_xcenter(), (sprite_get_ycenter()-abs(yspeed))-1, 2.5);
                
    instance_activate_object(objTeleport);
    with objTeleport {
        if !insideView() and boss == other.bossID {
            instance_destroy();
        }
    }
    
    instance_create(x, y, objBossDeathTimer);
    instance_destroy();
}

