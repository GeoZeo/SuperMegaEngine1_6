canDamage = true;

if !global.frozen {   
    if pose > -1 && isIntro {
        if y < ystart {
            update_rate = 1;
            gravityNoGround();
        }
        else {
            y = ystart;
            if pose > -1 {
                sprite_index = pose;
            }
            yspeed = 0;
            
            if image_speed == 0
                image_index = 0;
            image_speed = poseImgSpeed;
            
            if image_index >= image_number-1 {
                image_index = image_number-1;
                image_speed = 0;
                isIntro = false;
            }
        }
    }
    
    
    //Starting the actual fight
    if startFight {
        startFight = false;
        isFight = true;
        canHit = true;
    }
    
    
    //Hitspark and death
    if healthpoints < prevHealthPoints {
        event_user(14);
        if healthpoints > 0 {
            canHit = false;
            alarm[9] = 1;
            alarm[10] = 45; //Being able to get hit again
            drawBoss = true;
            drawHitSpark = false;
            
            global.bossHealth = healthpoints;
        }
        else {
            global.bossHealth = 0;
            healthpoints = 0;
            dead = true;
            event_user(15);
            if dead {
                stopAllSFX();
                playSFX(sfxDeath);
                
                var i, explosionID;
                    
                doExplosion(sprite_get_xcenter(), sprite_get_ycenter(), 1.5);
                
                doExplosion(sprite_get_xcenter(), sprite_get_ycenter(), 2.5);
                
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
 
    x += xspeed * update_rate;
    y += yspeed * update_rate; 
	
	//if instance_exists(prtPlayer) {
	//	if prtPlayer.canHit {
	//		if place_meeting(x, y, prtPlayer) {
	//	        event_user(1);
	//	    }
	//	}
	//}
}
else {
    if alarm[9] != -1
        alarm[9] += 1;
    if alarm[10] != -1
        alarm[10] += 1;
}

