/// @description playerDeathTimer()
function playerDeathTimer() {
	//Handles the delay before the player dies (if applicable)
	if killTime > 0 && killTimer < killTime && dead {
		killTimer++;
	
		if killTimer >= killTime {
			killTimer = killTime;
			global.frozen = false;
			if !deathByPit {
		        var i, explosionID;
            
		        i = 0;
		        repeat 8 {
		            explosionID = instance_create(x, y, objMegamanExplosion);
		            explosionID.dir = i;
		            explosionID.spd = 1.5;
                
		            i += 45;
		        }
        
		        i = 0;
		        repeat 8 {
		            explosionID = instance_create(x, y, objMegamanExplosion);
		            explosionID.dir = i;
		            explosionID.spd = 2.5;
                
		            i += 45;
		        }
		    }
    
		    instance_create(x, y, objMegamanDeathTimer); //Because the Mega Man object is destoyed upon death, we need to make a different object execute the room restarting code
		    instance_destroy();
    
		    stopAllSFX();
		    playSFX(sfxDeath);
		}
	}

}